<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<div>
	<form id="frm">
		<div>
		작성자: <input type="text" name="id" readonly="readonly" value="${login.id }">
		</div>
		<div>제목: <input type="text" name="title"></div>
		<div>
			<h4>내용:</h4>
			<textarea rows="13" cols="80" name="content"></textarea>
		</div>
	</form>
	<button type="button" onclick="location.href='bbslist.do'">목록</button>
	<button type="button" id="add_btn">글 추가</button>
</div>

<script>
$("#add_btn").click(function() {

	if($('input[name=title]').val()==""){
		alert("제목을 입력해주세요");
	}else if($('textarea[name=content]').val()==""){
		alert("내용을 입력해주세요");
	}else{
		
		let formdata = $("#frm").serialize();
		
		$.ajax({
			url:"addbbs.do",
			type:"get",
			datatype:"json",
			data: formdata,
			success:function(data){
				if(data==true){
					alert("글이 추가 되었습니다");
					location.href="./bbslist.do";
				}else{
					alert("글 추가 실패")
				}
			},
			error:function(){
				alert("error");
			}
		});
	}
});
</script>