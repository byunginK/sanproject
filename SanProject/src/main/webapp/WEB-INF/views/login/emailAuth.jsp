<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script>
	function check() {
		let form = document.authenform;
		let authNum = $
		{
			authNum
		}
		;

		if (!form.authNum.value) {
			alert("인증코드를 입력하세요!");
		}
		if (form.authnum.value != authNum) {
			alert("일치하지 않습니다. 이메일로 발송받은 인증코드를 다시 확인해 주세요.");
			form.authnum.value = "";
			return false;
		}
		if (form.authnum.value == authNum) {
			alert("인증이 완료되었습니다!");
			opener.document.userinput.mailCheck.value = "이메일 인증 완료";
			self.close();
		}
	}
</script>
<head>
<meta charset="UTF-8">
<title>Email 인증창</title>
</head>
<body>
	<div class="container">
		<form method="post" name="authenform" onSubmit="return check();">
			<input type="text" name="authnum"><br>
			<br> <input type="submit" class="btn btn-info" value="Submit">
		</form>
	</div>

</body>
</html>