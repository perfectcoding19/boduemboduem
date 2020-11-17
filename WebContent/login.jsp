<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="login_s.css">
<script>
	function fn_sendMember() {

		var frmMember = document.frmMember;
		var id = frmMember.ID.value;
		var pwd = frmMember.password.value;

		if (id.length == 0 || id == "") {
			alert("아이디입력은 필수입니다.");
		} else if (pwd.length == 0 || pwd == "") {
			alert("비밀번호 입력은 필수입니다.");
		} else {
			frmMember.method = "post";
			frmMember.action = "join_db";
			frmMember.submit();
		}
	}
</script>
</head>
<body>
	<div class="header">
		<jsp:include page="header.jsp" flush="false" />
	</div>
	<div class="section">
		<div class="tit">LogIn</div>
		<form name="frmMember">
			<table>
				<tr>
					<td><input class="box" type="text" name="ID" placeholder="아이디"></td>
				</tr>
				<tr>
					<td><input class="box" type="password" name="password" placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td align="center"><input class="s_btn" type="submit" value="로그인"
						onclick="fn_sendMember();"></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="footer">
		<jsp:include page="footer.jsp" flush="false" />
	</div>
</body>
</html>