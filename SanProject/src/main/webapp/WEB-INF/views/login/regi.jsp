<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div align="left">
	<h1 align="center" style="font-size: 50px;">
		<font color="darkgreen"><b>산스타 회원가입</b></font>
	</h1>
	<form action="regiAf.do" onsubmit="return validate()"
		onsubmit="oneCheckbox(a)" method="post">
		<table width="630" height="400" border="1" align="center"
			cellspacing="0">
			<tr height="10" align="center">
				<td colspan="2" style="background: darkgreen;"><font
					color=7CAA98><b>회원기본정보</b></font></td>
			</tr>
			<tr>
				<td><b>이메일 주소:</b></td>
				<td><input type="text" style="width: 170px" name="email"
					id="email" placeholder="sample@sansta.com" />
					<input type="button" id="btn" value="이메일 인증하기">
				</td>
			</tr>
			<tr>
				<td><b>비밀번호:</b></td>
				<td><input type="password" style="width: 170px" id="password"
					name="password" minlength="8" maxlength="20"
					placeholder="**********" /></td>
			</tr>
			<tr>
				<td><b>비번확인:</b></td>
				<td><input type="password" style="width: 170px"
					id="checkpassword" name="checkpassword" maxlength="12"
					placeholder="**********" /></td>
			</tr>
			<tr>
				<td><b>이름:</b></td>
				<td><input type="text" style="width: 170px" id="name"
					name="name" placeholder="이름을 입력해 주세요" /></td>
			</tr>
			<tr>
				<td><b>닉네임:</b></td>
				<td><input type="text" style="width: 170px" id="nickname"
					name="nickname" maxlength="15" placeholder="산쟁이" />닉네임 중복체크도 넣을 예정</td>
			</tr>
			<tr>
				<td><b>마케팅 수신여부:</b></td>
				<td>수신 거부<input type="checkbox" name="marketing" value="0"
					onclick="oneCheckbox(this);"> 수신 동의<input type="checkbox"
					name="marketing" value="1" onclick="oneCheckbox(this);">
				</td>

			</tr>
			<tr>
				<td colspan="1"><input type="submit" value="회원가입"></td>
			</tr>
		</table>

	</form>

</div>

<script language="javascript">
	function validate() {
		let re = /^[a-zA-Z0-9]{4,12}$/ // 패스워드가 적합한지 검사할 정규식
		let re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// 이메일이 적합한지 검사할 정규식

		let password = document.getElementById("password");
		let email = document.getElementById("email");
		let num1 = document.getElementById("num1");
		let num2 = document.getElementById("num2");
		let verification = document.getElementById("vfcheck");

		// ------------ 이메일 까지 -----------
		if (email.value == "") {
			alert("이메일을 입력해 주세요");
			email.focus();
			return false;
		}

		if (verification.value == "인증 완료") {
			alert("이메일 인증을 완료해주세요");
			email.focus();
			return false;
		}
		

		if (!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
			return false;
		}

		if (!check(re, password, "패스워드는 8~20의 영문 대소문자와 숫자로만 입력해주세요.")) {
			return false;
		}

		if (join.password.value != join.checkpassword.value) {
			alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
			join.checkpassword.value = "";
			join.checkpassword.focus();
			return false;
		}

		if (join.name.value == "") {
			alert("이름을 입력해 주세요");
			join.name.focus();
			return false;
		}
		if (join.nickname.value == "") {
			alert("닉네임을 입력해 주세요");
			join.name.focus();
			return false;
		}
		alert("회원가입이 완료되었습니다.");
	}

	function check(re, what, message) {
		if (re.test(what.value)) {
			return true;
		}
		alert(message);
		what.value = "";
		what.focus();
		//return false;
	}
</script>

<script type="text/javascript">
	function oneCheckbox(a) {

		let obj = document.getElementsByName("marketing");

		for (let i = 0; i < obj.length; i++) {

			if (obj[i] != a) {

				obj[i].checked = false;

			}
		}
	}

	let isRun = false;
	
	$("#btn").click(function(){
		if ($('input[name=email]').val() == "") {
			alert("email을 입력해주세요");
		} else if(isRun == true){
			return;
		}else{
			isRun = true;
			let email = $("#email").val();

	        $.ajax({
	           url : "emailAuths.do",
	           type : "POST",
			   data : {"email" : email},
			   dataType : "text",	
	           success : function(data) {
	                 console.log(data);
	                 input = "</br>" + "<input type=text name=vfcode value='"+ data +"' >"
	                 		 + "<input type=button id=vfcheck value=인증>"
	                 $("td:eq(3)").append(input);
	                 $("#vfcheck").click(function(){
		                 if($("input[name=vfcode]").val() == data){
			                 alert("완료");
			                 $("#vfcheck").val("인증 완료");
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