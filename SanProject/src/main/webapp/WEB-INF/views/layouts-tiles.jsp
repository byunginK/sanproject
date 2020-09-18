<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<tiles:insertAttribute name="header"/>
<style type="text/css">
#body_wrap { width:1150px; margin-left:auto; margin-right:auto; padding:0px; border: 1px solid}	
#content_wrap { float:left; width:980px; margin-right:0px; border: 1px solid #EFEFEF; padding: 5px; }
#middle_wrap { width:100%; padding:0px; margin:0px; text-align:center; border:solid 1px #EFEFEF;}

</style>
</head>
<body>

<!-- 화면 배치용 jsp -->

<div id="body_wrap">
	<div id="main_wrap">
		<tiles:insertAttribute name="top_menu"/>
	</div>

	<div id="middle_wrap">
		<div id="content_wrap">
			<tiles:insertAttribute name="main"/>			
		</div>		
	</div>
</div>


</body>
</html>








