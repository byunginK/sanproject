<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="width: 100%; height: 100%">
	<h1>Q&A 문의하기</h1>
	<div>
		<form id='qnaFrm'>
			<table border="1">
			<colgroup>
				<col width="100"><col width="400">
			</colgroup>
				<tr>
					<th>작성자</th><td>${login.nickname }<input type="hidden" name='email' value="${login.email }"></td>
				</tr>
				<tr>
					<th>제목</th><td><input type="text" name='title' style="width: 400">
				</tr>
				<tr>
					<th>내용</th><td><textarea name='content' style="width: 400; height: 300"></textarea></td>
				</tr>
			
			</table>
		</form>
	</div>
	<div>
		<div>
			<button type="button" id="write">문의하기</button>
		</div>
		<div>
			<button type="button" id='qnaList'>목록 돌아가기</button>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	$('#qnaList').click(function(){
		location.href='QnAList.do';
	});
	$('#write').click(function(){
		const formData = $('#qnaFrm').serialize();
		$.ajax({
			url:'writeQna.do',
			type:'post',
			data:formData,
			success: function(data){
				//alert('success');
				if(data>0){
					alert('문의가 완료 되었습니다');
					location.href='QnAList.do';
				}else{
					alert('error');
				}
			},
			error: function(){
				alert('error');
			}
		});

	});
});
</script>