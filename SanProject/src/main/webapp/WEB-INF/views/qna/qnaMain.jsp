<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="width: 100%; height: 100%">
	<h1 style="text-align: center;">Q&A</h1>
	<div>
		<button type="button" id='writeBtn'>문의하기</button>
	</div>
	<div>
	<table border="1">
	<colgroup>
		<col width="100"><col width="200"><col width="200"><col width="100"><col width="200">
	</colgroup>
		<thead>
			<tr>
				<th>No.</th><th>이름</th><th>제목</th><th>답변상태</th><th>작성날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty QnA }">
			<tr>
				<td colspan="6" style="text-align: center;">작성된 글이 없습니다</td>
			</tr>
			</c:if>
			<c:forEach items="${QnA }" var="qna" varStatus="vs">
					<tr>
						<td>${vs.count}</td><td>${qna.nickname }</td><td><a href='goQnaDetail.do?post_number=${qna.post_number }'>${qna.title }</a></td><td>${qna.step }</td><td>${qna.wdate }</td>
					</tr>
					
			</c:forEach>
		</tbody>
	
	</table>
	<div class="pg_container">
			<ul class = "pagination" id="pagination">
			</ul>
	</div>
	</div>
	
</div>

<script>
let totalCount = ${totalCount}; // 글의 총 수
let pageSize = 10; // 페이지 크기 [1] ~ [10] 아니면 [1] ~[5]
let nowPage = 1; //현재 페이지

let _totalPages = totalCount / pageSize;
if(totalCount % pageSize > 0){
	_totalPages++; // 나머지가 있으면 1페이지 추가
}


		

$(document).ready(function(){
	$("#writeBtn").click(function(){
		location.href='goWriteQnA.do';

	});
	$("#pagination").twbsPagination({
		startPage: 1,
		totalPages: _totalPages,
		visiblePages: 10,
		first:'<span aria-hidden="true">«</span>',
		prev:"이전",
		next:"다음",
		last:'<span aria-hidden="true">»</span>',
		onPageClick: function(event,page){
			nowPage = page;
			pagingQna(nowPage);
		}
	});
});

function pagingQna(nowPage){
	$.ajax({
		url:'pagingQna.do',
		type:'get',
		data:{pageNumber:nowPage},
		success:function(data){
		//	alert("success");
		$('tbody').empty();
			$.each(data,function(i,val){
				let qnaBbs = addQnaBbs(i+1,val.nickname,val.post_number, val.title, val.step, val.wdate);

				$('tbody').eq(-1).append(qnaBbs);
			});
			
		},
		error:function(){
			alert('error');
		}

	});
}

function addQnaBbs(count, nickname , post_number, title, step,wdate ){
	const qnaBbs= "<tr>"
		+"<td>"+count+"</td><td>"+nickname+"</td><td><a href='goQnaDetail.do?post_number="+post_number+"'>"+title+"</a></td><td>"+step+"</td><td>"+wdate+"</td>"
		+"</tr>";
	return qnaBbs;
}

</script>