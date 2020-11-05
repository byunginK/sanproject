<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="width: 100%; height: 100%">
	<h1 style="text-align: center;">Q&A</h1>
	<div>
		<button type="button" id='writeBtn'>문의하기</button>
	</div>
	<div>
	<table border="1">
	<colgroup>
		<col width="100"><col width="200"><col width="200"><col width="100"><col width="200">
	</colgroup>
		<thead>
			<tr>
				<th>No.</th><th>이름</th><th>제목</th><th>답변상태</th><th>작성날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty QnA }">
			<tr>
				<td colspan="6" style="text-align: center;">작성된 글이 없습니다</td>
			</tr>
			</c:if>
			<c:forEach items="${QnA }" var="qna" varStatus="vs">
					<tr>
						<td>${vs.count}</td><td>${qna.nickname }</td><td><a href='goQnaDetail.do?post_number=${qna.post_number }'>${qna.title }</a></td><td>${qna.step }</td><td>${qna.wdate }</td>
					</tr>
					
			</c:forEach>
		</tbody>
	
	</table>
	</div>
</div>
<script>
$(document).ready(function(){
	$("#writeBtn").click(function(){
		location.href='goWriteQnA.do';

	});
});

</script>