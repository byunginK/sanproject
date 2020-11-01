<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="width: 100%; height: 100%">
	<h1 style="text-align: center;">Q&A</h1>

	<table border="1">
	<colgroup>
		<col width="100"><col width="200"><col width="200"><col width="200"><col width="200"><col width="200">
	</colgroup>
		<thead>
			<tr>
				<th>No.</th><th>이름</th><th>제목</th><th>내용</th><th>답변상태</th><th>작성날짜</th>
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
				<td>${vs.count}</td><td>${qna.email }</td><td>${qna.title }</td><td>${qna.content }</td><td>${qna.step }</td><td>${qna.wdate }</td>
			</tr>
			</c:forEach>
		</tbody>
	
	</table>
</div>
