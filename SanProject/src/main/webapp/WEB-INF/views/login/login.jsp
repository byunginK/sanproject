<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty login }">	<!-- login이 되었을때 -->
${login.nickname }님 안녕하세요 	
<div align="right" style="height: 20px;"><a href="logout.do">로그아웃</a></div>
<table border="1"  bgcolor='gray'>
<col width="200">
<tr>
	<td>
		<a href="bbslist.do">글 목록</a>
	</td>
</tr>
<tr>
	<td>
		<a href="bbswrite.do">글 추가</a>
	</td>
</tr>
</table>

</c:if>

<c:if test="${empty login }"> 		<!-- login이 되지 않았을때 -->
<form action="loginAf.do" method="post">

<table border="1">
<tr>
	<td>아이디</td>
	<td>
		<input type="text" name="email" size="20">
	</td>
</tr>
<tr>
	<td>패스워드</td>
	<td>
		<input type="text" name="password" size="20">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="log-in">
	</td>	
</tr>
</table>
</form>

<a href="regi.do">회원가입</a>




</c:if>