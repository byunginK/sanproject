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
					<c:if test="${login.email == bbs.email }">
					<div style="float: right;">
						<a class="detailMenu"><i class="ellipsis vertical icon"></i></a>
						 <ul class='hide' id='menu'>
							<li><a href='#' onclick='delMain(${bbs.post_number})'>삭제</a></li>
							<li><a href='#' onclick='updateMain(${bbs.post_number})'>수정</a></li>
						</ul>
					</div>
					</c:if>
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
						<c:if test="${(cmt.step == 0) && (cmt.del == 0)}">
							<div id='cmtcontent${cmt.post_number}'class='_cmtcontent'>
								<div class='cmtnick'><i class="user icon"></i>
								<span>${cmt.nickname}</span></div>
									<div class='cmtcont'><span style="overflow-wrap:break-word;flex-basis: auto;">${cmt.content}</span></div>
									<c:choose>
										<c:when test="${(bbs.email eq login.email) || (cmt.email eq login.email)}">
											<div onclick='divDetailMenu("${cmt.post_number}")'><i class='ellipsis vertical icon'></i>
								                 <ul class='hide' id="ulDetailMenu${cmt.post_number}">
													<li><a onclick='answerReply("${cmt.post_number}")'>답글</a></li>
													<li><a onclick='removeComment("${cmt.post_number}", "${cmt.ref}", "${cmt.step}")'>삭제</a></li>
												</ul>
											</div>
										</c:when>
										<c:otherwise>
											<i class="plus icon" onclick='answerReply("${cmt.post_number}")'></i>
										</c:otherwise>
									</c:choose>
							</div>	
						</c:if>

						

						<c:if test="${(cmt.step > 0) && (cmt.del == 0)}">
							<div id='reply${cmt.post_number}' class='replydiv'>
								<div class='cmtnick'><i class="user icon"></i>
								<span>${cmt.nickname}</span></div>
								<div class='cmtcont'>
									<span style="overflow-wrap:break-word;flex-basis: auto;">${cmt.content}</span>
								</div>
								<c:if test="${(bbs.email eq login.email) || (cmt.email eq login.email)}">
									<div onclick='divDetailMenu("${cmt.post_number}")'><i class='ellipsis vertical icon'></i>
								          <ul class='hide' id="ulDetailMenu${cmt.post_number}">
												<li onclick='removeComment("${cmt.post_number}", "${cmt.ref}", "${cmt.step}")'><a>삭제</a></li>
										  </ul>
									</div>	
								</c:if>
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
		$(".detailMenu").click(function() {
			var submenu = $(this).next("ul");
			if (submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});

	});
    function divDetailMenu(post_number){
    	 $("#ulDetailMenu" + post_number).slideToggle();	
	};


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
										let bbsEmail = "${bbs.email}";
										let loginEmail = "${login.email}";
										let addcmt = "";
										//$("#test").remove();
										$.each(data,function(i, remove) {
													$("#cmtcontent"+ remove.post_number).remove();
													$("#reply"+ remove.post_number).remove();
													$("#ans"+ remove.post_number).remove();
										});
 
										$.each(data,function(i, cmt) {
											if ((cmt.step == 0) && (cmt.del == 0)) {
												addcmt += "<div id='cmtcontent"+cmt.post_number+"' class='_cmtcontent'>"
											       +  "<div class='cmtnick'><i class='user icon'></i>"
												   +  "<span>"+cmt.nickname+"</span></div>"
												   +  "<div class='cmtcont'><span style='overflow-wrap:break-word; flex-basis:auto'>"+cmt.content+"</span></div>";
												   if((bbsEmail == loginEmail) || (cmt.email == loginEmail)){
													   addcmt += "<div onclick='divDetailMenu(" +'"'+ cmt.post_number+'"'+")'><i class='ellipsis vertical icon'></i>"
										                 	  +  "<ul class='hide' id=ulDetailMenu"+cmt.post_number+">"
															  +  "<li><a onclick='answerReply(" +'"'+ cmt.post_number+'"'+")'>답글</a></li>"
															  +  "<li><a onclick='removeComment("+'"'+cmt.post_number+'"'+","+'"'+cmt.ref+'"'+","+'"'+cmt.step+'"'+")')'>삭제</a></li></ul></div></div>";
							
												   }
												   else{
													   addcmt += "<i class='plus icon' onclick='answerReply(" +'"'+ cmt.post_number+'"'+")'></i></div>";
												   }
												   addcmt +=  "<div id='ans"+cmt.post_number+"' class='_ans' style='display: none'>"
														   +  "<input type=text id=answer"+cmt.post_number+" name='answer"+cmt.post_number+"' placeholder=답글 달기  size=25%>"
													       +  "<i class='plus icon' id='answerSubmit"+cmt.post_number+"'></i></div>";
													       

													
											}
											if ((cmt.step > 0)  && (cmt.del == 0)) {
												addcmt += "<div id='reply"+cmt.post_number+"' class='replydiv' >"
												       +  "<div class='cmtnick'><i class='user icon'></i>"
													   +  "<span>"+ cmt.nickname+"</span></div  class='cmtcont'><span style='overflow-wrap:break-word; flex-basis:auto'>"+cmt.content+"</span></div>";
												   if((bbsEmail == loginEmail) || (cmt.email == loginEmail)){
													   addcmt += "<div onclick='divDetailMenu(" +'"'+ cmt.post_number+'"'+")'><i class='ellipsis vertical icon'></i>"
									                 	      +  "<ul class='hide' id=ulDetailMenu"+cmt.post_number+">"
														      +  "<li onclick='removeComment("+'"'+cmt.post_number+'"'+","+'"'+cmt.ref+'"'+","+'"'+cmt.step+'"'+")')'><a>삭제</a></li></ul></div>";
						 
												   }

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
												let bbsEmail = "${bbs.email}";
												let loginEmail = "${login.email}";
												let addcmt = "";
												//$("#test").remove();
												$.each(data,function(i, remove) {
															$("#cmtcontent"+ remove.post_number).remove();
															$("#reply"+ remove.post_number).remove();
															$("#ans"+ remove.post_number).remove();
												});
		 
												$.each(data,function(i, cmt) {
													if ((cmt.step == 0) && (cmt.del == 0)) {
														addcmt += "<div id='cmtcontent"+cmt.post_number+"' class='_cmtcontent'>"
													       +  "<div class='cmtnick'><i class='user icon'></i>"
														   +  "<span>"+cmt.nickname+"</span></div>"
														   +  "<div class='cmtcont'><span style='overflow-wrap:break-word; flex-basis:auto'>"+cmt.content+"</span></div>";
														   if((bbsEmail == loginEmail) || (cmt.email == loginEmail)){
															   addcmt += "<div onclick='divDetailMenu(" +'"'+ cmt.post_number+'"'+")'><i class='ellipsis vertical icon'></i>"
												                 	  +  "<ul class='hide' id=ulDetailMenu"+cmt.post_number+">"
																	  +  "<li><a onclick='answerReply(" +'"'+ cmt.post_number+'"'+")'>답글</a></li>"
																	  +  "<li><a onclick='removeComment("+'"'+cmt.post_number+'"'+","+'"'+cmt.ref+'"'+","+'"'+cmt.step+'"'+")')'>삭제</a></li></ul></div></div>";
									
														   }
														   else{
															   addcmt += "<i class='plus icon' onclick='answerReply(" +'"'+ cmt.post_number+'"'+")'></i></div>";
														   }
														   addcmt +=  "<div id='ans"+cmt.post_number+"' class='_ans' style='display: none'>"
																   +  "<input type=text id=answer"+cmt.post_number+" name='answer"+cmt.post_number+"' placeholder=답글 달기  size=25%>"
															       +  "<i class='plus icon' id='answerSubmit"+cmt.post_number+"'></i></div>";
															       

															
													}
													if ((cmt.step > 0)  && (cmt.del == 0)) {
														addcmt += "<div id='reply"+cmt.post_number+"' class='replydiv' >"
														       +  "<div class='cmtnick'><i class='user icon'></i>"
															   +  "<span>"+ cmt.nickname+"</span></div  class='cmtcont'><span style='overflow-wrap:break-word; flex-basis:auto'>"+cmt.content+"</span></div>";
														   if((bbsEmail == loginEmail) || (cmt.email == loginEmail)){
															   addcmt += "<div onclick='divDetailMenu(" +'"'+ cmt.post_number+'"'+")'><i class='ellipsis vertical icon'></i>"
											                 	      +  "<ul class='hide' id=ulDetailMenu"+cmt.post_number+">"
																      +  "<li onclick='removeComment("+'"'+cmt.post_number+'"'+","+'"'+cmt.ref+'"'+","+'"'+cmt.step+'"'+")')'><a>삭제</a></li></ul></div>";
								 
														   }

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


	function removeComment(post_number, ref, step) {

								let main_post_number = $("#main_post_number").val();
								$.ajax({
											url : 'removeComment.do',
											type : 'get',
											data : {"main_post_number" : main_post_number,
												    "post_number" : post_number,
												    "ref" : ref,
												    "step" :step},
											datatype : "json",
											success : function(data) {
												let bbsEmail = "${bbs.email}";
												let loginEmail = "${login.email}";
												let addcmt = "";
												//$("#test").remove();
												$.each(data,function(i, remove) {
															$("#cmtcontent"+ remove.post_number).remove();
															$("#reply"+ remove.post_number).remove();
															$("#ans"+ remove.post_number).remove();
												});
		 
												$.each(data,function(i, cmt) {
																	if ((cmt.step == 0) && (cmt.del == 0)) {
																		addcmt += "<div id='cmtcontent"+cmt.post_number+"' class='_cmtcontent'>"
																	       +  "<div class='cmtnick'><i class='user icon'></i>"
																		   +  "<span>"+cmt.nickname+"</span></div>"
																		   +  "<div class='cmtcont'><span style='overflow-wrap:break-word; flex-basis:auto'>"+cmt.content+"</span></div>";
																		   if((bbsEmail == loginEmail) || (cmt.email == loginEmail)){
																			   addcmt += "<div onclick='divDetailMenu(" +'"'+ cmt.post_number+'"'+")'><i class='ellipsis vertical icon'></i>"
																                 	  +  "<ul class='hide' id=ulDetailMenu"+cmt.post_number+">"
																					  +  "<li><a onclick='answerReply(" +'"'+ cmt.post_number+'"'+")'>답글</a></li>"
																					  +  "<li><a onclick='removeComment("+'"'+cmt.post_number+'"'+","+'"'+cmt.ref+'"'+","+'"'+cmt.step+'"'+")')'>삭제</a></li></ul></div></div>";
													
																		   }
																		   else{
																			   addcmt += "<i class='plus icon' onclick='answerReply(" +'"'+ cmt.post_number+'"'+")'></i></div>";
																		   }
																		   addcmt +=  "<div id='ans"+cmt.post_number+"' class='_ans' style='display: none'>"
																				   +  "<input type=text id=answer"+cmt.post_number+" name='answer"+cmt.post_number+"' placeholder=답글 달기  size=25%>"
																			       +  "<i class='plus icon' id='answerSubmit"+cmt.post_number+"'></i></div>";
																			       

																			
																	}
																	if ((cmt.step > 0)  && (cmt.del == 0)) {
																		addcmt += "<div id='reply"+cmt.post_number+"' class='replydiv' >"
																		       +  "<div class='cmtnick'><i class='user icon'></i>"
																			   +  "<span>"+ cmt.nickname+"</span></div  class='cmtcont'><span style='overflow-wrap:break-word; flex-basis:auto'>"+cmt.content+"</span></div>";
																		   if((bbsEmail == loginEmail) || (cmt.email == loginEmail)){
																			   addcmt += "<div onclick='divDetailMenu(" +'"'+ cmt.post_number+'"'+")'><i class='ellipsis vertical icon'></i>"
															                 	      +  "<ul class='hide' id=ulDetailMenu"+cmt.post_number+">"
																				      +  "<li onclick='removeComment("+'"'+cmt.post_number+'"'+","+'"'+cmt.ref+'"'+","+'"'+cmt.step+'"'+")')'><a>삭제</a></li></ul></div>";
												 
																		   }
		
																	}
																});
												$("#ajaxComment").html(addcmt).trigger("create");
												$("input[name='content']").val("");
											},
											error : function() {
												alert("error");
											}

										});

							
	}
	function delMain(main_post_number){
		$.ajax({
			url:'delMain.do',
			type:'get',
			data:{"seq":main_post_number},
			success:function(data){
				if(data==true){
					alert("글이 삭제 되었습니다.");
					location.href='bbslist.do';
				}else{
					alert("글 삭제 실패");
				}
			},
			error:function(){
				alert('error');
			}
		});
	}

	function updateMain(main_post_number){
		location.href='updateMain.do?post_number='+main_post_number;
	}
</script>