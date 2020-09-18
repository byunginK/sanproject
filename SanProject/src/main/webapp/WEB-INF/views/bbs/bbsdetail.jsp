<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>    
    
<h1>작성한 글</h1>
<table border="1px solid" >
<col width="100px"><col width="300px">
<tr>
	<th colspan="2">${login.id }님이 작성하신 글</th><th>작성일</th><td>${bbs.wdate }</td><th>조회수</th><td>${bbs.readcount }</td>
</tr>
<tr>
	<th>정보</th><td colspan="5">${bbs.ref }-${bbs.step }-${bbs.depth }</td>
</tr>
<tr>
	<th >제목</th><td align="center" colspan="5">${bbs.title }</td>
</tr>
<tr>
	<th colspan="6">내용</th>
</tr>
<tr>
	<td colspan="6">${bbs.content }</td>
</tr>
</table>
<button type="button" id="list_btn" onclick="location.href='bbslist.do'">목록</button>
<c:if test="${login.id eq bbs.id}">
	<button type="button" id="updatebbs_btn">수정</button>
	<button type="button" id = "deletebbs_btn">삭제</button>
</c:if>


<h3>댓글</h3>
<table>
	<tr>
		<th>제목</th><td><input type="text" id="replytitle" size="30"></td>
	</tr>
	<tr>
		<th>내용</th><td><textarea rows="5" cols="50" id="replycontent"></textarea></td>
	</tr>
</table>
<button type="button" id="addreply_btn">댓글 작성</button>

<script>
$("#deletebbs_btn").click(function(){
	let seq = ${bbs.seq};
	location.href="removebbs.do?seq="+seq;
});
$("#updatebbs_btn").click(function(){
	let seq = ${bbs.seq};
	location.href="updatebbs.do?seq="+seq;
});
</script>
