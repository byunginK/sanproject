<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="content_wrap">
	<h2>main</h2>

	
	<c:forEach items="${bbslist }" var="bbs">
		<input type="hidden" id="email" name="email" value="${login.email}">


			<table border="1" class="maintb">
				<tr>
					<th>작성자</th>
					<td>${bbs.nickname}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><a href="goBbsDetail.do?post_number=${bbs.post_number}">${bbs.title}</a></td>
				</tr>
				<tr>
					<th>지역</th>
					<td>${bbs.location}</td>
				</tr>
				<tr>
					<th colspan="2">사진</th>
				</tr>
				<tr>
					<td colspan="2">
						<ul class="bxslider">
							<c:forEach items="${bbs.imgs}" var="img">
								<li><a href="#"><img src="image/${img}" alt="이미지 없음"></a></li>
							</c:forEach>
						</ul>
					</td>
				</tr>

				<tr>
					<td><button type="button" onclick='getBbsLike("${bbs.post_number}","${login.email}")'>좋아요</button></td>
					<td><input id="like_count${bbs.post_number}" type="text" value="${bbs.likecount}"></td>
				</tr>

				<tr>
					<th colspan="2">내용</th>
				</tr>
				<tr>
					<td colspan="2">${bbs.content}</td>
				</tr>
				<tr>
					<td><input type="text" name="content" id="content${bbs.post_number}" placeholder="댓글 달기"></td>
					<td><button type="button" onclick='comment_button("${bbs.post_number}","${login.email}")'>게시</button></td>
				</tr>
			</table>
		
		<br>
		<br>
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
	
	let test = window.innerHeight;

	let np = 0;
	$(window).scroll(function() {
        
    var height = Math.round($("#content_wrap").height())-test;
        
     if ( 150 >= height - Math.round( $(window).scrollTop())) {
        console.log(Math.round( $(window).scrollTop()));
        np+=1;
        console.log(np);
        $.ajax({
			url:'addlist.do',
			type:"get",
			data:{pageNumber:np},
			success:function(data){
				//alert("success");
				let addlist = "";
				let login_email = $("#email").val();
				$.each(data,function(i,bbs){
				/* let imgs = JSON.stringify(bbs.imgs);
				let arr = imgs.split(',');
				alert(arr); */
				addlist +="<br><br><table border='1' class='maintb'>"
						+"<tr><td>작성자</td><td>"+bbs.nickname+"</td></tr>"
						+"<tr><td>제목</td><td><a href=goBbsDetail.do?post_number="+bbs.post_number+">"+bbs.title+"</td></tr>"
						+"<tr><td>지역</td><td>"+bbs.location+"</td></tr>"
						+"<tr><td colspan='2'>사진</td><tr><td colspan='2'><ul class='bxslider', onload='bxSlider()'>";
						
				for(var j = 0; j < bbs.imgs.length; j++){
				addlist+="<li><a href='#'><img src=\"image/"+bbs.imgs[j]+"\" alt='이미지 없음'></a></li>";
					}		
				
				addlist	+="</ul></td></tr>"
						+"<tr><td><button type='button' onclick=\"getBbsLike('"+bbs.post_number+"','"+bbs.email+"')\">좋아요</button></td>"
						+"<td><input  id=\"like_count"+bbs.post_number+"\" type='text' value='"+bbs.likecount+"'></td></tr>"
						+"<tr><td colspan='2'>내용</td></tr>"
						+"<tr><td colspan='2'>"+bbs.content+"</td></tr>"
						+"<tr><td><input type=text name=content id=content"+bbs.post_number+" placeholder=댓글달기></td>"
						+"<td><button type=button onclick='comment_button("+'"'+bbs.post_number+'"'+","+'"'+login_email+'"'+")'>게시</button></td></tr>"
						+"</table>";
				
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
				$("#like_count" + post_number).val(data);
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
				alert("댓글이 추가돼었습니다.");
				 $("#content" + main_post_number).val("");
			},
			error : function() {
				alert("error");
			}

		});
	   
	}

function getBbsLike(post_number, email){
	$.ajax({
		url:'checkLike.do',
		type:'get',
		data:{'main_post_number':post_number, 'email':email},
		success:function(data){
			$("#like_count" + post_number).val(data);
		},
		error:function(){
			alert("error");
		}
			
	});
}

</script>