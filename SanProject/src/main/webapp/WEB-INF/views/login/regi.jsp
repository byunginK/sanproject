<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h2>회원가입</h2>
<p>환영합니다</p>

<div align="left">

	<form action="regiAf.do" method="post">

		<table border="1">
			<tr>
				<td>email</td>
				<td><input type="text" id="email" name="email" size="25"><br>
					email
					<p id="emailcheck" style="font-size: 8px"></p> <input type="button"
					id="btn" value="email 확인"></td>
			</tr>
			<tr>
				<td>password</td>
				<td><input type="text" name="password" size="25"></td>
			</tr>
			<tr>
				<td>name</td>
				<td><input type="text" name="name" size="25"></td>
			</tr>
			<tr>
				<td>nickname</td>
				<td><input type="text" name="nickname" size="25"></td>
			</tr>
			<tr>
				<td>marketing</td>
				<td>
					수신 거부<input type="checkbox" name="marketing" value="0" onclick="oneCheckbox(this);">
					수신 동의<input type="checkbox" name="marketing" value="1" onclick="oneCheckbox(this);">
				</td>

			</tr>
			<tr>
				<td colspan="1"><input type="submit" value="회원가입"></td>
			</tr>
		</table>

	</form>

</div>

<script type="text/javascript">
	function oneCheckbox(a) {

		let obj = document.getElementsByName("marketing");

		for (let i = 0; i < obj.length; i++) {

			if (obj[i] != a) {

				obj[i].checked = false;

			}

		}

	}
</script>
