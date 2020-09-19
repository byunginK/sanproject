<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout.css">
</head>
<body>
<div id="body_wrap">
	<div id="main_wrap">
		<tiles:insertAttribute name="top_menu"/>
	</div>

	<div id="middle_wrap">
		<div id="side_bar">
			<tiles:insertAttribute name="left_bar"/>
		</div>
		<div id="mycontent_wrap">
			<tiles:insertAttribute name="main" />
		</div>
	</div>
</div>


</body>
</body>
</html>