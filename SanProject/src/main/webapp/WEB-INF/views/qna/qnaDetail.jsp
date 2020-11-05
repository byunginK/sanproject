<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="width: 100%; height: 100%">
<h1>${qna.title }</h1>
<h5>작성자</h5><span>${qna.nickname}</span>
<h5>작성일자</h5><span>${qna.wdate }</span>
<h5>문의 내용</h5>
<textarea style="width: 400; height: 300" readonly="readonly">${qna.content }</textarea>
<c:if test="${qna.email eq login.email }">
	<div>
		<div><button type="button" id='deleteBtn'>삭제</button></div>
		<div><button type="button" id='updateBtn'>내용수정</button></div>
	
	</div>
</c:if>
	<div>
		<button type="button" id = 'goQnaList'>목록으로 돌아가기</button>
	</div>
</div>

<script>
	$(document).ready(function(){
		
		const postNumber = ${qna.post_number};

		$('#goQnaList').click(function(){
			location.href='QnAList.do';
		});
		
		$("#deleteBtn").click(function(){
			$.ajax({
				url:'deleteQna.do',
				type:'get',
				data:{post_number:postNumber},
				success:function(data){
					if(data>0){
						alert('삭제 되었습니다');
						location.href='QnAList.do';
					}
				},
				error:function(){
					alert('error');
				}
				
			});

		});

		$('#updateBtn').click(function(){
			$('#deleteBtn').hide();
			$("#updateBtn").hide();
			$("#updateBtn").after("<button type='button' id='updateDone'>수정하기</button>");
			$('textarea').removeAttr('readonly');
			$("textarea").focus();
		});

		
	});

	$(document).on('click',"#updateDone",function(){
		const postNumber = ${qna.post_number};
		let con = $("textarea").val();
		$.ajax({
			url:'updateQna.do',
			type:'post',
			data:{content:con, post_number: postNumber},
			success:function(data){
				if(data > 0 ){
					alert('수정이 완료 되었습니다');
					location.href='QnAList.do';
				}
			},
			error:function(){
				alert('error');
			}
				
		});
	});
</script>