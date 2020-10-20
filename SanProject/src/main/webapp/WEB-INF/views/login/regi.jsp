<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style>
#wrapper {
	border: 2px solid salmon;
	border-radius: 5px;;
	width: 400px;
	height: 400px;
	margin: auto;
}

.title {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	color: black;
	margin: 20px 0px 20px 0px;
}

width


















:









 









95px


















;
display


















:









 









inline-block


















;
text-align


















:









 









right


















;
font-size


















:









 









13px


















;
}
input {
	margin: 3px 5px;
	border-radius: 3px;
	background-color: transparent;
	border: 1px solid darkgray;
	height: 20px;
	outline: none;
}

#signup {
	text-align: center;
	margin: 5px;
}

input[type=button], input[type=reset] {
	border: 1px solid salmon;
	border-radius: 3px;
	background-color: transparent;
	margin: 0px;
	height: 24px;
	color: salmon;
}

input[type=button]:hover, input[type=reset]:hover {
	background-color: salmon;
	transition-duration: 1s;
	color: white;
	outline: none;
}

#roadAddress, #detailAddress {
	width: 280px;
}

2





















.regex {
	font-size: 12px;
	text-align: center;
}
</style>

<h1 align="center" style="font-size: 50px;">
	<font color="darkgreen"><b>산스타 회원가입</b></font>
</h1>
<form action="regiAf.do" method="POST" id="signform">
	<!-- <form action="regiAf.do" onsubmit="oneCheckbox(a)" method="POST"
	id="signform"> -->

	<div id="wrapper">
		<div class="title">회원 가입 정보 입력</div>
		<label>이메일 : </label> <input type="text" name="email" id="email"
			required placeholder="이메일 인증을 해주세요."> <input type="button"
			value="중복확인" id="duplcheck1"> <input type="button"
			value="이메일인증" id=emailbtn><br> <span id="email_check"
			class="w3-text-red"></span>
		<div class="email regex" id="email"></div>

		<label>패스워드 : </label><input type="password" name="pw" id="pw"
			placeholder="********" required><br>
		<div class="pw regex"></div>

		<label>패스워드확인 : </label><input type="password" id="repw"
			placeholder="********" required><br>
		<div class="repw regex"></div>

		<label>이름 : </label><input type="text" name="name" id="name"
			placeholder="이름을 입력해주세요" required><br>
		<div class="name regex"></div>

		<label>닉네임 : </label><input type="text" name="nickname" id="nickname"
			placeholder="닉네임 중복확인을 해주세요" maxlength="15" required> <input
			type="button" value="중복확인" id="duplcheck2">
		<div class="nickname regex"></div>

		<label>마케팅 수신여부 : </label>수신 거부<input type="checkbox" name="marketing"
			value="0" onclick="oneCheckbox(this);"> 수신 동의<input
			type="checkbox" name="marketing" value="1"
			onclick="oneCheckbox(this);"> <br>
		<div class="oneCheckbox(this);"></div>

		<div id="signup">
			<input type="button" name="signup" value="회원가입" id="signupbtn">
			<input type="reset" value="다시입력" id="resignupbtn">
		</div>
	</div>
</form>
<script>
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
