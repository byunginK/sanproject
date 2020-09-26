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

<table width="300" height="320" border="1" align="center"
			cellspacing="0">
<tr>
	<td>이메일</td>
	<td>
		<input type="text" name="email">
	</td>
</tr>
<tr>
	<td>비밀번호</td>
	<td>
		<input type="password" name="password" id="password">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="로그인">
	</td>	
</tr>
</table>
</form>

<a href="regi.do">회원가입</a>
<a href="https://careers.kakao.com/login">카카오로그인</a>
<a href="https://nid.naver.com/nidlogin.login?url=">네이버로그인</a>
<a href="https://accounts.google.com/login/signinchooser?flowName=GlifWebSignIn&flowEntry=ServiceLogin">구글로그인</a>





</c:if>