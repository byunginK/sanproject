<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 화면 배치용 jsp -->

<table border="1" width="100%" height="100%" bordercolro="gray"> 

<tr align="center">			<!-- header -->
	<td height="10%" colspan="3">
		<tiles:insertAttribute name="header"/>
	</td>
</tr>

<tr>						<!-- menu, main -->
	<td width="20%" align="left" valign="top">
		<tiles:insertAttribute name="menu"/>
	</td>
	<td>
		<tiles:insertAttribute name="content"/>
	</td>
	<td width="15%" align="center" valign="middle">
		<tiles:insertAttribute name="act"/>
	</td>
</tr>

<tr align="center">			<!-- footer -->
	<td height="10%" colspan="3">
		<tiles:insertAttribute name="footer"/>
	</td>
</tr>

</table>


</body>
</html>








