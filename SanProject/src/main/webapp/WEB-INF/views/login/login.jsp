<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container">
   <div class="c1">
      
      <div class="c11">
         <h1 class="mainhead">SAN</h1>
         <p class="mainp">산에서 찍은 사진을 함께 공유해요</p>
      </div>
      <div id="left"><h1 class="s1class"><span>SIGN</span><span class="su">IN</span>
      </h1></div>
      <div id="right"><h1 class="s2class"><span>SIGN</span><span class="su">UP</span></h1></div>
   </div>
   <div class="c2">
   <div class="signup">
      <form  action="regiAf.do" method="POST" id="signform">
      <br>
         <h1 class="signup1">SIGN UP</h1>
         <br><br>
			<input name="email" id="email" type="text" placeholder="email" class="username2" required="required"/>
			<a href="#" id="duplcheck1" class='chcektag'>중복확인</a>
			<div><a href="#" id=emailbtn class='chcektag2'>이메일인증</a></div>
			<span id="email_check" class="w3-text-red"></span>
			<div class="email regex" id="email"></div>
			<input name="pw" type="password" placeholder="Password" class="username" id="pw" required="required"/>
         	<div class="pw regex"></div>
         	<input type="password" id="repw"placeholder="Password 확인" required class="username">
			<div class="repw regex"></div>
			<input type="text" name="name" id="name" placeholder="이름을 입력해주세요" required class="username">
		<div class="name regex"></div>
			<input type="text" name="nickname" id="nickname" placeholder="닉네임  입력" maxlength="15" required class="username2">
			<a href="#" id="duplcheck2" class='chcektag'>중복확인</a>
			<div class='chcektag2'>마케팅 수신여부 : 수신 거부&nbsp;<input type="checkbox" name="marketing" value="0" onclick="oneCheckbox(this)">&nbsp;&nbsp;수신 동의&nbsp;<input type="checkbox" name="marketing" value="1"	onclick="oneCheckbox(this)"></div>
		<div class="nickname regex"></div>
         <button class="btn">Sign Up</button>
      </form>
      </div>
      <div class="signin">
      <form  action="loginAf.do" method="post">
         <br>
         <h1 class="signup1">SIGN IN</h1>
         <br><br><br><br>
         <input name="email" type="text" placeholder="email" class="username"/>
			
			<input name="password" type="password" placeholder="Password" class="username"/>
         
         <button class="btn">Get Started</button>
         
         <br><br><br><br>
       <!--   <a href=""><p class="signup2">Forget Password?</p></a> -->
      </form>
       <div id="kakaoLogin" style="text-align: center">
			<a href="${kakao_url}"> <img
				src="image/kakao_login_medium_wide.png" width="200" height="43"/></a>
		</div>
		<div id="naverLogin" style="text-align: center">
			<a href="${naver_url}"> <img src="image/nal.PNG" width="200" /></a>
		</div>
      </div>
     
   </div>
</div>

<script>
$(document).ready(function(){
	   $(".container").fadeIn(1000);
	   $(".s1class").css({"color":"#EE9BA3"});
	   $(".s2class").css({"color":"#748194"}); 
	   $("#left").removeClass("left_hover");
	   $("#right").addClass("right_hover");
	   $(".signin").css({"display":""});
	   $(".signup").css({"display":"none"});
});
	$("#right").click(function(){
	   $("#left").removeClass("left_hover");
	   $(".s2class").css({"color":"#EE9BA3"});
	   $(".s1class").css({"color":"#748194"});
	   $("#right").addClass("right_hover");
	   $(".signin").css({"display":"none"});
	   $(".signup").css({"display":""});
	});
	$("#left").click(function(){
	   $(".s1class").css({"color":"#EE9BA3"});
	   $(".s2class").css({"color":"#748194"}); 
	   $("#right").removeClass("right_hover");
	   $("#left").addClass("left_hover");
	   $(".signup").css({"display":"none"});
	   $(".signin").css({"display":""});
	});

	$("#duplcheck1").click(function() {

		let email = $("#email").val();
		console.log(email);
		$.ajax({
			url : "check_email.do",
			type : "POST",
			data : {
				"email" : email
			},
			success : function(test) {
				if (test == 1) {
					alert("중복된 이메일이 존재합니다.")
				} else {
					alert("사용 가능한 이메일 입니다.")
				}
			}
		});
	});

	$("#duplcheck2").click(function() {
		let nickname = $("#nickname").val();
		console.log(nickname);
		$.ajax({
			url : "check_nickname.do",
			type : "POST",
			data : {
				"nickname" : nickname
			},
			success : function(test) {
				if (test == 1) {
					alert("중복된 닉네임이 존재합니다.")
				} else {
					alert("사용 가능한 닉네임 입니다.")
				}
			}
		});
	});

	$(function() {
		// 중복확인 & id 유효성검사             
		$("#duplcheck")
				.on(
						"click",
						function() {
							let nickname = $("#nickname").val();
							if (nickname == "") {
								alert("닉네임을 입력해주세요");
								return;
							}
							let regex = /^[a-z][a-z\d]{4,11}$/;
							let result = regex.exec(id);

							if (result != null) {
								$(".nickname.regex").html("");
								window
										.open("nicknameDuplCheck.jsp?nickname="
												+ nickname, "",
												"width=500px,height=300px,top=300px,left=200px");
							} else {
								$(".nickname.regex").html("영어 소문자,숫자 4-12자리");
								$(".nickname.regex").css("color", "red")
							}

						})

		//email유효성 검사
		$("#email").on("input", function() {
			var regex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
			var result = regex.exec($("#email").val());

			if (result != null) {
				$(".email.regex").html("");
			} else {
				$(".email.regex").html("올바른 이메일이 아닙니다");
			}
		})

		//비밀번호 유효성검사
		$("#pw").on("input", function() {
			let regex = /^[A-Za-z\d]{8,12}$/;
			let result = regex.exec($("#pw").val())

			if (result != null) {
				$(".pw.regex").html("");
			} else {
				$(".pw.regex").html("영어대소문자,숫자 8-11자리");
				$(".pw.regex").css("color", "red")
			}
		});

		//비밀번호 확인    
		$("#repw").on("keyup", function() {
			if ($("#pw").val() == $("#repw").val()) {
				$(".repw.regex").html("비밀번호가 일치합니다");
			} else {
				$(".repw.regex").html("비밀번호가 일치하지않습니다");
			}
		})

		//이름 유효성검사
		$("#name").on("input", function() {
			let regex = /[가-힣]{2,}/;
			let result = regex.exec($("#name").val());

			if (result != null) {
				$(".name.regex").html("");
			} else {
				$(".name.regex").html("한글만 입력 가능합니다.");
			}
		})

		//회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
		$("#signupbtn").on("click", function() {
			let email = $("#email").val();
			let nickname = $("#nickname").val();
			let pw = $("#pw").val();
			let name = $("#name").val();

			var emailregex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
			var nicknameregex = /^[a-z][a-z\d]{4,11}$/;
			var pwregex = /^[A-Za-z\d]{8,12}$/;
			var nameregex = /[가-힣]{2,}/;

			var emailregex = emailregex.exec(email);
			if (emailregex == null) {
				alert("이메일양식을 다시 확인해주세요");
				retrun;
			}
			var pwregex = pwregex.exec(pw);
			if (pwregex == null) {
				alert("비밀번호양식을 다시 확인해주세요");
				retrun;
			}
			var nicknameregex = nicknameregex.exec(nickname);
			if (nicknameregex == null) {
				alert("아이디양식을 다시 확인해주세요");
				return;
			}

			var nameregex = nameregex.exec(name);
			if (nameregex == null) {
				alert("이름양식을 다시 확인해주세요");
				retrun;
			}

			//빈칸 없을 때 제출.
			$("#signform").submit();

		})

	});
	function oneCheckbox(a) {

		let obj = document.getElementsByName("marketing");

		for (let i = 0; i < obj.length; i++) {

			if (obj[i] != a) {

				obj[i].checked = false;

			}
		}
	}

	let isRun = false;

	$("#emailbtn")
			.click(
					function() {
						if ($('input[name=email]').val() == "") {
							alert("email을 입력해주세요");
						} else if (isRun == true) {
							return;
						} else {
							isRun = true;
							let email = $("#email").val();

							$
									.ajax({
										url : "emailAuths.do",
										type : "POST",
										data : {
											"email" : email
										},
										dataType : "text",
										success : function(data) {
											console.log(data);

											input = "</br>"
													+ "<input type=text name=vfcode value='"+ data +"' >"
													+ "<input type=button id=vfcheck value=인증>";
											$(".email.regex").prepend(input);
											/// $("td:eq(3)").append(input);
											//$("auth").append(input);
											//$("email").append(input);
											$("#vfcheck")
													.click(
															function() {
																if ($(
																		"input[name=vfcode]")
																		.val() == data) {
																	alert("완료");
																	$(
																			"#vfcheck")
																			.val(
																					"인증 완료");
																}

															});
										},
										error : function() {
											alert("error");
										}
									});
						}
					});
</script>