<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="width: 100%; height: 800px;">
 <c:forEach items="${search }" var="ser">
 	<div style="width: 300px; height: 400px; display: inline-block; margin: 22px">
 		<div>
 			<span>${ser.nickname }</span>
 		</div>
 		<div>
 			<span><a href='goBbsDetail.do?post_number=${ser.post_number }'>${ser.location }</a></span>
 		</div>
 		<div>
 			<a href='goBbsDetail.do?post_number=${ser.post_number }'>
	 		<div>
		        <ul class="bxslider">
		           <c:forEach items="${ser.imgs}" var="img">
		           		<li><img src="image/${img}" alt="이미지 없음" width='100%' height='100%'></li>
		           </c:forEach>
		        </ul>
		    </div>
		    </a>
 		</div>
 	</div>
 
 </c:forEach>
</div>

<script>
$(document).ready(function() {
    $('.bxslider').bxSlider();
   
 });
</script>