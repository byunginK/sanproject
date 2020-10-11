<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${not empty login }">
	<!-- login이 되었을때 -->
${login.nickname }님 안녕하세요 	


<div align="right" style="height: 20px;">
		<a href="logout.do">로그아웃</a>
	</div>
	<table border="1" bgcolor='gray'>
		<col width="200">
		<tr>
			<td><a href="bbslist.do">글 목록</a></td>
		</tr>
		<tr>
			<td><a href="bbswrite.do">글 추가</a></td>
		</tr>
	</table>

</c:if>



<c:if test="${empty login }">
	<!-- login이 되지 않았을때 -->

	<form action="loginAf.do" method="post">

		<table width="300" height="320" border="1" align="center"
			cellspacing="0">
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" id="password">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="로그인"> <button type="button" onclick="location.href='regi.do' ">회원가입</button> </td>
			</tr>

		</table>
	</form>
	<center>
		<!--  <a
			href="https://kauth.kakao.com/oauth/authorize?client_id=e99b0f9897b065cf7fbc95f66d44a16b&redirect_uri=http://localhost:8080/spring/login.do&response_type=code"><img
			src="image/kakao_login_medium_wide.png" /></a> -->

		<div id="kakaoLogin" style="text-align: center">
			<a href="${kakao_url}"> <img
				src="image/kakao_login_medium_wide.png" width="300" height="60" /></a>
		</div>
		<div id="naverLogin" style="text-align: center">
			<a href="${naver_url}"> <img src="image/nal.PNG" width="300" /></a>
		</div>


	</center>
</c:if>