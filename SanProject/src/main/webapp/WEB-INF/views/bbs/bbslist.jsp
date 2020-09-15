<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<div align="center" style="overflow: scroll; height: 400px; overflow-x:hidden" >

<%-- <table border="1">
<col width="70"><col width="600"><col width="150"><col width="150">

<tr>
	<th>번호</th><th>제목</th><th>작성일</th><th>작성자</th>
</tr>

<c:if test="${empty bbslist }">
	<tr>
		<td colspan="4">작성된 글이 없습니다</td>
	</tr>
</c:if>

<c:forEach items="${bbslist }" var="bbs" varStatus="vs">
	
	<c:if test="${bbs.del==1 }">
		<tr>
			<th>${vs.count }</th><td colspan="3" style="color: red;">이 글은 작성자에 의해 삭제 되었습니다.</td>
		</tr>
	</c:if>
	<c:if test="${bbs.del!=1 }">
	<tr>
		<th>${vs.count }</th>
		
		<td class="seqclick" onclick="location.href='bbsdetail.do?seq=${bbs.seq }'">
			${bbs.title }
		</td>
		
		<td>
			${bbs.wdate }
		</td>
		<td>
			${bbs.email }
		</td>
	</tr>
	</c:if>
</c:forEach>

</table>
</div>
<a href="bbswrite.do">글쓰기</a>
<div align="center">
<select id="choice">
	<option value="sel">선택</option>
	<option value="id">작성자</option>
	<option value="title">제목</option>
	<option value="content">내용</option>
</select>
<input type="text" id="search">
<button type="button" id="searchBbs">검색</button>  --%>
</div>



<script>
$("#searchBbs").click(function(){
	let choice = $("#choice").val();
	let search = $("#search").val();
	location.href="bbssearch.do?choice="+choice+"&search="+search;

});
</script>
