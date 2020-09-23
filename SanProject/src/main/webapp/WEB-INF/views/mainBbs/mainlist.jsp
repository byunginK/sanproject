<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>	
	
<div id="content_wrap">
	<h2>main</h2>
	
	<c:forEach items="${bbslist }" var="bbs" >
	<div>
		<table border="1">
			<tr>
				<th>작성자</th><td>${bbs.nickname}</td>
			<tr>
			<tr>
				<th>제목</th><td>${bbs.title}</td>
			</tr>
			<tr>
				<th>지역</th><td>${bbs.location}</td>
			</tr>
			<tr>
				<th colspan="2">사진</th>
			<tr>
			<tr><td colspan="2">
				<c:forEach items="${bbs.imgs}" var="img">
				<img alt="" src="image/${img}" width="300px" height="200px">
				</c:forEach>
				</td>
			</tr>
			<tr>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td colspan="2">${bbs.content }</td>
			</tr>
		
		</table>
	</div>
	<br><br>
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