<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>    
<h1>수정할 글</h1>
<table border="1px solid" >
<col width="100px"><col width="300px">
<tr>
	<th colspan="2">${login.id }님이 작성하신 글</th><th>작성일</th><td>${bbsdto.wdate }</td><th>조회수</th><td>${bbsdto.readcount }</td>
</tr>
<tr>
	<th>정보</th><td colspan="5">${bbsdto.ref }-${bbsdto.step }-${bbsdto.step }</td>
</tr>
<tr>
	<th >제목</th><td align="center" colspan="5"><input type="text" id="bbstitle" value="${bbsdto.title }" size="85"></td>
</tr>
<tr>
	<th colspan="6">내용</th>
</tr>
<tr>
	<td colspan="6"><textarea rows="10" cols="100" id="bbscontent"> ${bbsdto.content }</textarea></td>
</tr>
</table>
<button type="button" id="revice_btn">수정</button>
<button type="button" onclick="location.href='bbslist.do'">목록</button>
<script>
$("#revice_btn").click(function(){
	let update={
			seq:${bbsdto.seq},
			title:$("#bbstitle").val(),
			content:$("#bbscontent").val()
			};
	$.ajax({
		url:"./bbsupdate.do",
		type:"get",
		datatype:"json",
		data:update,
		success:function(data){
			if(data==true){
				alert('글이 수정 되었습니다');
				location.href="bbslist.do";
			}else{
				alert('수정 실패');
			}
		},
		error:function(){
			alert("error");
		}
				
	});
});
</script>