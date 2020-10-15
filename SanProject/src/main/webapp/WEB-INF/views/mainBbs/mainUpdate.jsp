<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="ui segments">
		<form id="frm" action="updateMainBbs.do" method="post">
			<div>
					 <input type="hidden" name="post_number" value="${bbs.post_number}">
			</div>
			
			<div class="ui segment">
				위치  : <input type="text" name="location" value="${bbs.location }" style="border: none; outline-style: none; font-size:18;">
			</div>
			
			
			<div class="ui segment">
				<h4>내용:</h4>
				<textarea rows="13" cols="80" name="content" style="border: none; outline-style: none; font-size:18;">${bbs.content }</textarea>
			</div>
			
			
		</form>
			
			<button type="button" onclick="location.href='bbslist.do'">목록</button>
			<button type="button" id="update_btn">글 수정</button>
	</div>
	
<script>
$(document).ready(function(){
	$("#update_btn").click(function(){
		let formDate = $("#frm").serialize();
		$.ajax({
			url:'updateMainBbs.do',
			type:'post',
			data:formDate,
			success:function(data){
				if(data>0){
					alert("글이 수정 되었습니다");
					location.href="bbslist.do";
				}
			},
			erro:function(){
				alert("error");
			}
			
	 	});
	});
	
});

</script>