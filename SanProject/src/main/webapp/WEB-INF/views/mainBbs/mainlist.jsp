<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="content_wrap">
 <input type="hidden" id="email" name="email" value="${login.email}">

	<div class='row'>
	<div class='col-md-8'>
    <c:forEach items='${bbslist }' var='bbs'>
    <div class='card mb-4'>
    	<a href='goBbsDetail.do?post_number=${bbs.post_number}'>
    	<div class='card-img-top'>
    	
           <ul class='bxslider'>
              <c:forEach items='${bbs.imgs}' var='img'>
                 <li><img src='image/${img}' alt='이미지 없음' width='450w'></li>
              </c:forEach>
           </ul>
        
        </div>
        </a>
            <div class='card-body'>
            	<div style='height: 30px'>
               <div style='float: left;'><img src='image/sanlogo.png' width='30w' height='30w'></div>
               <div class='nicknameptag'>${bbs.nickname}</div>
               </div>
			   <i class='heart icon' onclick='getBbsLike("${bbs.post_number}","${login.email}")'></i>
               <span id="like_count${bbs.post_number}">${bbs.likecount}</span>
               
               <p>${bbs.content}</p>
               
               <div>
               <input type="text" name="content" id="content${bbs.post_number}" placeholder="댓글 달기" style="border: none; outline-style: none; font-size:16; width: 90%">
               <i class="big comment alternate outline icon" onclick='comment_button("${bbs.post_number}","${login.email}")'></i>
           	   </div>
   
         	</div>
        <div class='card-footer text-muted'>
               <div style="float: left;">${bbs.location}</div>
               <div style="float: right;">
               <c:if test='${login.email == bbs.email }'>
               <a href='#' onclick='delMain(${bbs.post_number})'>삭제</a>&nbsp;&nbsp;
               <a href='#' onclick='updateMain(${bbs.post_number})'>수정</a>
               </c:if>
               </div>
       </div>
      </div>
      
   </c:forEach>
   </div>
   </div>
</div>
<div id="chat_wrap">
   <div id="openchat">
      <h2>San 오픈 채팅</h2>
      <table border="1">
      
      	<tr>
      		<th>산에 대한 이야기 시작하기</th>
      		<td>
      			<input type="button" id='enterBtn' value="입장" onclick="connect()"> 
      			<input type="button" id='exitBtn' value="나가기" onclick="disconnect()">
      		</td>
      	</tr>
      	<tr>
      		<td colspan="2">
      			<textarea id="charMessageArea" style="width: 360px; height: 300px" ></textarea>
      		</td>
      	</tr>
      	<tr>
      		<td colspan="2">
      			<input type="text" id='message'>
      			<input type="button" id="sendBtn" value="전송" onclick="send()">
      		</td>
      	</tr>
      
      </table>
   </div>
   
</div>
<script>
let wsocket;


   $(document).ready(function() {
      $('.bxslider').bxSlider();
      
   });

   $(document).on('scroll', function(){
      $('.bxslider').bxSlider();
   });
	
   
   /* $(document).on('click','.menu2',function(){
	   
		var submenu = $(".menu2 i").next("ul");
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
		
	}); */

   let np = 0;
   $(window).scroll(function() {
   
    let wh = Math.round($(window).height());
    
    let height = Math.round($("#content_wrap").height());
    
     if ( wh >= height - $(window).scrollTop()) {
        np+=1;
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
            addlist +="<div class='card mb-4'><a href=goBbsDetail.do?post_number="+bbs.post_number+">"
					+"<div class='card-img-top'><ul class='bxslider'>";
					for(var j = 0; j < bbs.imgs.length; j++){
			            addlist+="<li><img src=\"image/"+bbs.imgs[j]+"\" alt='이미지 없음' width='450w'></li>";
			        } 
			addlist +="</ul></div></a>"		
					+"<div class='card-body'><div style='height: 30px'>"
					+"<div style='float: left;'><img src='image/sanlogo.png' width='30w' height='30w'></div>"
					+"<div class='nicknameptag'>"+bbs.nickname+"</div></div>"
					+"<i class='heart icon' onclick=\"getBbsLike('"+bbs.post_number+"','"+bbs.email+"')\"></i>"
					+"<span id=\"like_count"+bbs.post_number+"\">"+bbs.likecount+"</span>"
					+"<p>"+bbs.content+"</p>"
					+"<div><input type='text' name='content' id='content"+bbs.post_number+"' placeholder='댓글 달기' style='border: none; outline-style: none; font-size:16;' size='68'>"
					+"<i class='big comment alternate outline icon' onclick='comment_button("+'"'+bbs.post_number+'"'+","+'"'+login_email+'"'+")'></i></div></div>"
					+"<div class='card-footer text-muted'>"
					+"<div style='float: left;'>"+bbs.location+"</div>"
					+"<div style='float: right;'>";
					
					if(login_email == bbs.email){

						addlist += "<a href='#' onclick='delMain("+bbs.post_number+")'>삭제</a>&nbsp;&nbsp;"
								+"<a href='#' onclick='updateMain("+bbs.post_number+")'>수정</a>";
				
	            	}    
			addlist+="</div></div></div>";

            });
            
            $(".mb-4").eq(-1).after(addlist);
            
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

function delMain(main_post_number){
	$.ajax({
		url:'delMain.do',
		type:'get',
		data:{"seq":main_post_number},
		success:function(data){
			if(data==true){
				alert("글이 삭제 되었습니다.");
				location.href="bbslist.do";
			}else{
				alert("글 삭제 실패");
			}
		},
		error:function(){
			alert('error');
		}
	});
}

function updateMain(main_post_number){
	location.href='updateMain.do?post_number='+main_post_number;
}

function delAndUp(post_number){
	$("#menu" + post_number).slideToggle();
}

function connect(){
	if(wsocket != undefined && wsocket.readyState != WebSocket.CLOSED){
		alert("이미 입장하셨습니다.");
		return;
	}else{
		wsocket = new WebSocket("ws://192.168.0.7:8090/spring/echo.do");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage; 
		/* wsocket.close = onClose; */
	}	
}
  
function disconnect(){
	wsocket.close();
	$.ajax({
		url:'exitChat.do',
		type:'get',
		success(data){
			appendMessage(data);
		},
		error(){
			alert('error');
		}
	});
	
}

function onOpen(evt){	
	appendMessage("오픈 채팅을 시작 합니다");
}
function onMessage(evt){
	let data = evt.data;
	if(data.substring(0,4)=="msg:"){ 
		appendMessage(data.substring(4));
	}
}
/* function onClose(evt){	
	appendMessage("오픈 채팅을 나갑니다");
	
} */

function send(){	
	let id = '${login.nickname}';
	let msg = $("#message").val();
	if(msg != "" && msg != null){
		wsocket.send("msg:"+ id + ":"+ msg);
		$("#message").val("");
	}
}

function appendMessage(msg){ 
	$("#charMessageArea").append(msg + "\n");

	const top = $("#charMessageArea").prop("scrollHeight");
	$("#charMessageArea").scrollTop(top);
}
</script>