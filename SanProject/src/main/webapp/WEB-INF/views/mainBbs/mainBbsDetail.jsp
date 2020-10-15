<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class='detailborder'>
		<form id="bbsForm">
			<input type="hidden" id="email" name="email" value="${login.email}">
			<input type="hidden" id="main_post_number" name="main_post_number" value="${bbs.post_number }">
			
				<div class='mainbbsdetailimg'>
						<ul class="bxslider">
							<c:forEach items="${bbs.imgs}" var="img">
								<li><a href="#"><img src="image/${img}" alt="이미지 없음"></a></li>
							</c:forEach>
						</ul>
				</div>
				<div class='detailDiv'>
					<div class="detailTopInfo">
					<div style="float: right;">
						<i class="ellipsis vertical icon"></i>
					</div>
					<div>
						<i class="user icon"></i>
						<span class='nicknameptag'>${bbs.nickname}</span>
					</div>
					<div style="margin-top: 5px">	
						<span>${bbs.location}</span>
					</div>
					<div class='detailcont'>${bbs.content }</div>
					</div>
				
				<div id="ajaxComment">

					<c:forEach items="${cmtlist}" var="cmt">
						
						<c:if test="${cmt.step == 0}">
							<div id='cmtcontent${cmt.post_number}'class='_cmtcontent'>
								<div class='cmtnick'><i class="user icon"></i>
								<span>${cmt.nickname}</span></div>
								<div class='cmtcont'><span style="overflow-wrap:break-word;flex-basis: auto;">${cmt.content}</span></div>
								<i class="plus icon" onclick='answerReply("${cmt.post_number}")'></i>
							</div>	
						</c:if>

						

						<c:if test="${cmt.step > 0}">
							<div id='reply${cmt.post_number}' class='replydiv'>
								<div class='cmtnick'><i class="user icon"></i>
								<span>${cmt.nickname}</span></div>
								<span class='cmtcont'>${cmt.content}</span>
							</div>
						</c:if>

						<div id="ans${cmt.post_number}" class='_ans' style="display: none">
							<input type="text" id="answer${cmt.post_number}" name="answer${cmt.post_number}" placeholder="답글 달기" size="25%">
							<i class="plus icon" id="answerSubmit${cmt.post_number}"></i>
						</div>
					</c:forEach>
				</div>
				<div class="ui label">
					<i class="heart icon" onclick='getBbsLike("${bbs.post_number}","${login.email}")'></i> 
					<span id="like_count${bbs.post_number}">${bbs.likecount}</span>
				</div>
				<div class='detailcomment'>
					<input type="text" name="content" placeholder="댓글 달기" size="43%"> 
					<i class="big comment alternate outline icon" id="comment_button"></i>
				</div>
			</div>
			
		</form>

</div>
<script>
	$(document).ready(function() {
		$('.bxslider').bxSlider({
			pager:false
			});

	});


	function getBbsLike(post_number, email) {
		$.ajax({
			url : 'checkLike.do',
			type : 'get',
			data : {
				'main_post_number' : post_number,
				'email' : email
			},
			success : function(data) {
				$("#like_count" + post_number).html(data);
			},
			error : function() {
				alert("error");
			}

		});
	}

	$("#comment_button")
			.click(
					function() {
						let cmtdata = $("#bbsForm").serialize();
						$.ajax({
									url : 'addCmt.do',
									type : 'get',
									data : cmtdata,
									datatype : "json",
									success : function(data) {
										let addcmt = "";
										//$("#test").remove();
										$.each(data,function(i, remove) {
													$("#cmtcontent"+ remove.post_number).remove();
													$("#reply"+ remove.post_number).remove();
													$("#ans"+ remove.post_number).remove();
										});
 
										$.each(data,function(i, cmt) {
															if (cmt.step == 0) {
																addcmt += "<div id='cmtcontent"+cmt.post_number+"' class='_cmtcontent'>"
																       +  "<div class='cmtnick'><i class='user icon'></i>"
																	   +  "<span>"+cmt.nickname+"</span></div>"
																	   +  "<div class='cmtcont'><span>"+cmt.content+"</span></div>"
																       +  "<i class='plus icon' onclick='answerReply(" +'"'+ cmt.post_number+'"'+")'></i></div>"
																	   +  "<div id='ans"+cmt.post_number+"' class='_ans' style='display: none'>"
																	   +  "<input type=text id='answer"+cmt.post_number+"' name='answer"+cmt.post_number+"' placeholder=답글 달기  size=25%>"
																       +  "<i class='plus icon' id=answerSubmit"+cmt.post_number+"></i></div>";
																	
															}
															if (cmt.step > 0) {
																addcmt += "<div id='reply"+cmt.post_number+"' class='replydiv' >"
																       +  "<div class='cmtnick'><i class='user icon'></i>"
																	   +  "<span>"+ cmt.nickname+"</span></div><span class='cmtcont'>"+cmt.content+"</span></div>";

															}
														});
										$("#ajaxComment").html(addcmt).trigger("create");	//동적 생성 후 css 적용을 위해 trigger("create")를 붙여야한다
										$("input[name='content']").val("");
									},
									error : function() {
										alert("error");
									}

								});

					});

	function answerReply(post_number) {
		if ($("#ans" + post_number).css("display") == "none") {
			$("#ans" + post_number).show();
			$("#answer" + post_number).focus();
			//let replydata = $("#bbsForm").serialize();

			$("#answerSubmit" + post_number)
					.click(
							function() {
								let email = $("#email").val();
								let main_post_number = $("#main_post_number")
										.val();
								let content = $("#answer" + post_number).val();
								$.ajax({
											url : 'addReply.do',
											type : 'get',
											data : {
												"email" : email,
												"main_post_number" : main_post_number,
												"content" : content,
												"post_number" : post_number
											},
											datatype : "json",
											success : function(data) {
												let addcmt = "";
												//$("#test").remove();
												$.each(data,function(i, remove) {
															$("#cmtcontent"+ remove.post_number).remove();
															$("#reply"+ remove.post_number).remove();
															$("#ans"+ remove.post_number).remove();
												});
		 
												$.each(data,function(i, cmt) {
																	if (cmt.step == 0) {
																		addcmt += "<div id='cmtcontent"+cmt.post_number+"' class='_cmtcontent'>"
																	       +  "<div class='cmtnick'><i class='user icon'></i>"
																		   +  "<span>"+cmt.nickname+"</span></div>"
																		   +  "<div class='cmtcont'><span>"+cmt.content+"</span></div>"
																	       +  "<i class='plus icon' onclick='answerReply(" +'"'+ cmt.post_number+'"'+")'></i></div>"
																		   +  "<div id='ans"+cmt.post_number+"' class='_ans' style='display: none'>"
																		   +  "<input type=text id=answer"+cmt.post_number+" name='answer"+cmt.post_number+"' placeholder=답글 달기  size=25%>"
																	       +  "<i class='plus icon' id='answerSubmit"+cmt.post_number+"'></i></div>";
																			
																	}
																	if (cmt.step > 0) {
																		addcmt += "<div id='reply"+cmt.post_number+"' class='replydiv' >"
																	       +  "<div class='cmtnick'><i class='user icon'></i>"
																		   +  "<span>"+ cmt.nickname+"</span></div><span class='cmtcont'>"+cmt.content+"</span></div>";
		
																	}
																});
												$("#ajaxComment").html(addcmt).trigger("create");
												$("input[name='content']").val("");
											},
											error : function() {
												alert("error");
											}

										});

							});
		} else {
			$("#ans" + post_number).hide();
			$("#answer" + post_number).val("");
		}
	}
</script>