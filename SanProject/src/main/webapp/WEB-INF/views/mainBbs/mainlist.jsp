<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="content_wrap">
 <input type="hidden" id="email" name="email" value="${login.email}">
    <c:forEach items="${bbslist }" var="bbs">
    <div class="maintb">
            <div class="ui segments">
              <div class="ui segment ">
               <p class='nicknameptag'>${bbs.nickname}</p>

               <div style="float: left">
                  <p>${bbs.location}</p>
               </div>
               <div style="float: right">
                 <i class="ellipsis vertical icon"></i>
               </div>

            </div>
            
               <div class='imgst'>
                  <ul class="bxslider">
                     <c:forEach items="${bbs.imgs}" var="img">
                        <li><a href="#"><img src="image/${img}" alt="이미지 없음" width='100%' height='100%'></a></li>
                     </c:forEach>
                  </ul>
               </div>
            
            <div class="ui label">
               <i class="heart icon" onclick='getBbsLike("${bbs.post_number}","${login.email}")'></i>
               <span id="like_count${bbs.post_number}">${bbs.likecount}</span>
            </div>
            
           <div class='contst'><a href="goBbsDetail.do?post_number=${bbs.post_number}">${bbs.content}</a></div>
            
            <div class="ui segment" >
               <input type="text" name="content" id="content${bbs.post_number}" placeholder="댓글 달기" style="border: none; outline-style: none; font-size:16;" size="73">
               <i class="big comment alternate outline icon" onclick='comment_button("${bbs.post_number}","${login.email}")'></i>
            </div>
   
         </div>
        
      <div class="ui hidden divider"></div>
      </div>
   </c:forEach>
   
</div>
<div id="chat_wrap">
   <div id="openchat">
      <h2>chat</h2>
   </div>
   <div id="chatbot">
      <h2>chatbot</h2>
   </div>
</div>
<script>
   $(document).ready(function() {
      $('.bxslider').bxSlider();
      
   });

   $(document).on('scroll', function(){
      $('.bxslider').bxSlider();
   });
   
   let np = 0;
   $(window).scroll(function() {
   console.log(Math.round( $(window).scrollTop()));
    let wh = Math.round($(window).height());
    
    let height = Math.round($("#content_wrap").height());
    console.log('height:'+height);
    console.log('wh:'+wh);
    console.log('body:'+$('body').height());
     if ( wh >= height - $(window).scrollTop()) {
        np+=1;
         console.log('np:'+np);
        $.ajax({
         url:'addlist.do',
         type:"get",
         data:{pageNumber:np},
         success:function(data){
            //alert("success");
            let addlist = "";
            let login_email = $("#email").val();
            $.each(data,function(i,bbs){
            //let imgs = JSON.stringify(bbs.imgs);
            //let arr = imgs.split(',');
            //alert(arr); 
            addlist +="<div class='maintb'><div class='ui segments'>"
                  +"<div class='ui segment'><p class='nicknameptag'><b>"+bbs.nickname+"</b></p><div style='float: left'><p>"+bbs.location+"</p> </div>"            
                      +"<div style='float: right'><i class='ellipsis vertical icon'></i></div></div>"
                  +"<div class='imgst'><ul class='bxslider'>";
                  
            for(var j = 0; j < bbs.imgs.length; j++){
            addlist+="<li><a href='#'><img src=\"image/"+bbs.imgs[j]+"\" alt='이미지 없음' width='100%' height='100%'></a></li>";
               }      
            
            addlist   +="</ul></div>"
                  +"<div class='ui label'><i class='heart icon' onclick=\"getBbsLike('"+bbs.post_number+"','"+bbs.email+"')\"></i>"
                  +"<span id=\"like_count"+bbs.post_number+"\">"+bbs.likecount+"</span></div>"
                  +"<div class='contst'><a href=goBbsDetail.do?post_number="+bbs.post_number+">"+bbs.content+"</a></div>"
                  +"<div class='ui segment'><input type='text' name='content' id='content"+bbs.post_number+"' placeholder='댓글 달기' style='border: none; outline-style: none; font-size:16;' size='73'>"
                  +"<i class='big comment alternate outline icon' onclick='comment_button("+'"'+bbs.post_number+'"'+","+'"'+login_email+'"'+")'></i></div>"
                  +"</div><div class='ui hidden divider'></div></div>";
            });
            
            $(".maintb").eq(-1).after(addlist);
            
         },
         error:function(){
            alert("error");
         }
        });
     }  
    });

   function getBbsLike(post_number, email) {
      $.ajax({
         url : 'checkLike.do',
         type : 'get',
         data : {
            'main_post_number' : post_number,
            'email' : email
         },
         success : function(data) {
            $("#like_count" + post_number).html(data);
         },
         error : function() {
            alert("error");
         }

      });
   }

   function comment_button(main_post_number, email) {
      let content = $("#content" + main_post_number).val();
       $.ajax({
         url : 'addCmt.do',
         type : 'get',
         data : {"email" : email, "main_post_number" : main_post_number, "content" : content},
         success : function(data) {
            alert("댓글이 추가 하였습니다.");
             $("#content" + main_post_number).val("");
         },
         error : function() {
            alert("error");
         }

      });
      
   }



</script>