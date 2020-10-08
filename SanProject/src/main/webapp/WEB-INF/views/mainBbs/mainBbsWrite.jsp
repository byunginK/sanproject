<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="ui segments">
		<form id="frm" name="fileForm" action="addmainBbswrite.do" method="post" enctype="multipart/form-data">
			<div>
					 <input type="hidden" name="email" value="${login.email}">
			</div>
			
			<div class="ui segment">
				위치 추가 : <input type="text" name="location" style="border: none; outline-style: none; font-size:18;">
			</div>
			
			<div class="ui segment">
				제목: <input type="text" name="title" style="border: none; outline-style: none; font-size:18;">
			</div>
			
			<div class="ui segment">
				<input multiple="multiple" type="file" id="name" name="file" />
				<input type="hidden" name="src" /> 
			</div>
			
			<div class="ui segment">
				<h4>내용:</h4>
				<textarea rows="13" cols="80" name="content" style="border: none; outline-style: none; font-size:18;"></textarea>
			</div>
			
			
		</form>
			
			<button type="button" onclick="location.href='bbslist.do'">목록</button>
			<button type="button" id="add_btn">글 추가</button>
	</div>

	<script>
		$("#add_btn").click(function() {

			if ($('input[name=location]').val() == "") {
				alert("위치를 입력해주세요");
			} else if ($('textarea[name=content]').val() == "") {
				alert("내용을 입력해주세요");
			} else if ($('input[name=title]').val() == ""){
				alert("제목을 입력해주세요");
			} else {

				let formData = new FormData($("#frm")[0]); 
				// $("#frm").serialize();은 파일을 넘겨 줄 수 없어서 FormData로 변경
	            
	            $.ajax({
	               url : "addmainBbswrite.do",
	               type : 'post',
	               processData : false,
	               contentType : false,
				   data : formData,
				   dataType : 'json',	
	               success : function(retunController) {
	                  if (retunController == true) {
	                     alert("글이 추가 되었습니다");
	                     location.href = "./bbslist.do";
	                  } else {
	                     alert("글 추가 실패")
	                  }
	               },
	               error : function() {
	                  alert("error");
	               }
	            });
	         }
	      });

	</script>

</body>
</html>