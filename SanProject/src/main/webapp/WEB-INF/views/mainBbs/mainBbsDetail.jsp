<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div style="border: 1px solid;height: 652px;width: 1020px">
		<form id="bbsForm">
			<input type="hidden" id="email" name="email" value="${login.email}">
			<input type="hidden" id="main_post_number" name="main_post_number" value="${bbs.post_number }">
			
				<div class='mainbbsdetailimg'>
						<ul class="bxslider">
							<c:forEach items="${bbs.imgs}" var="img">
								<li><a href="#"><img src="image/${img}" alt="이미지 없음" width="100%" height="100%"></a></li>
							</c:forEach>
						</ul>
				</div>
				<div style="width: 400px; height:650px; margin-top: 10; float: right;">
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
					<div style="width: 400px;margin-top: 5px;padding-left: 10px;padding-right: 10px;">${bbs.content }</div>
					
				
				<div id="ajaxComment" style="height: 72%; overflow: auto; margin-top: 15px; border-top:1px solid; border-bottom:1px solid; margin-bottom: 10px; padding-top: 10px ">

					<c:forEach items="${cmtlist}" var="cmt">
						<div id='cmtcontent${cmt.post_number}'>
							<c:if test="${cmt.step == 0}">
								<i class="user icon"></i>
								<span>${cmt.nickname}</span>
								<input readonly="readonly" style="border: none; outline-style: none;" size="41%" value="${cmt.content}">
								<i class="plus icon" onclick='answerReply("${cmt.post_number}")'></i>
							</c:if>

						</div>

						<c:if test="${cmt.step > 0}">
							<div id='reply${cmt.post_number}' style="margin-left: 15px">
								<i class="user icon"></i>
								<span>${cmt.nickname}</span> <span>${cmt.content}</span>
							</div>
						</c:if>

						<div id="ans${cmt.post_number}" style="display: none">
							<input type="text" id="answer${cmt.post_number}" name="answer${cmt.post_number}" placeholder="답글 달기" style="border: none; outline-style: none;" size="25%">
							<i class="plus icon" id="answerSubmit${cmt.post_number}"></i>
						</div><br>
					</c:forEach>
				</div>
				<div class="ui label">
					<i class="heart icon" onclick='getBbsLike("${bbs.post_number}","${login.email}")'></i> 
					<span id="like_count${bbs.post_number}">${bbs.likecount}</span>
				</div>
				<div style=" margin-top: 10px; padding-top: 10px; border-top: 1px solid;">
					<input type="text" name="content" placeholder="댓글 달기" style="border: none; outline-style: none; font-size: 15;" size="43%"> 
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
																addcmt += "<div id=cmtcontent"+cmt.post_number+">"
																       +  "<i class='user icon'></i>"
																	   +  "<span>"+cmt.nickname+"</span>"
																	   +  "<input readonly=readonly style='border: none; outline-style: none' size=25% value="+cmt.content+">"
																       +  "<i class='plus icon' onclick='answerReply(" +'"'+ cmt.post_number+'"'+")'></i></div><br>"
																	   +  "<div id=ans"+cmt.post_number+" style='display: none'>"
																	   +  "<input type=text id=answer"+cmt.post_number+" name=answer"+cmt.post_number+" placeholder=답글 달기 style='border: none; outline-style: none;' size=25%>"
																       +  "<i class='plus icon' id=answerSubmit"+cmt.post_number+"></i></div>";
																	
															}
															if (cmt.step > 0) {
																addcmt += "<div id=reply"+cmt.post_number+">"
																       +  "&nbsp;&nbsp;&nbsp;&nbsp;<i class='user icon'></i>"
																	   +  "<span>"+ cmt.nickname+"</span><span>"+cmt.content+"</span></div><br>";

															}
														});
										$("#ajaxComment").html(addcmt);
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
																		addcmt += "<div id=cmtcontent"+cmt.post_number+">"
																		       +  "<i class='user icon'></i>"
																			   +  "<span>"+cmt.nickname+"</span>"
																			   +  "<input readonly=readonly style='border: none; outline-style: none' size=25% value="+cmt.content+">"
																		       +  "<i class='plus icon' onclick='answerReply(" +'"'+ cmt.post_number+'"'+")'></i></div><br>"
																			   +  "<div id=ans"+cmt.post_number+" style='display: none'>"
																			   +  "<input type=text id=answer"+cmt.post_number+" name=answer"+cmt.post_number+" placeholder=답글 달기 style='border: none; outline-style: none;' size=25%>"
																		       +  "<i class='plus icon' id=answerSubmit"+cmt.post_number+"></i></div>";
																			
																	}
																	if (cmt.step > 0) {
																		addcmt += "<div id=reply"+cmt.post_number+">"
																			   +  "&nbsp;&nbsp;&nbsp;&nbsp;<i class='user icon'></i>"
																		       +  "<span>"+ cmt.nickname+"</span><span>"+cmt.content+"</span></div><br>";
		
																	}
																});
												$("#ajaxComment").html(addcmt);
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