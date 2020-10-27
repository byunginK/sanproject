<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout.css">
<tiles:insertAttribute name="header"/>
</head>
<body id="login_body_wrap">

	<!-- 화면 배치용 jsp -->


	<tiles:insertAttribute name="login"/>
	


</body>
</html>








