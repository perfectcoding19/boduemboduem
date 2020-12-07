<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="../login/login_s.css">
</head>
<body>
	<div class="header">
		<jsp:include page="../main/header.jsp" flush="false" />
	</div>
	<div class="section">
		<div class="tit">LogIn</div>
		<form method="post" action="../login/login_db.jsp">
			<table>
				<tr>
					<td><input class="box" type="text" name="id" maxlength="10" placeholder=" 아이디"></td>
				</tr>
				<tr>
					<td><input class="box" type="password" name="passwd" maxlength="15" placeholder=" 비밀번호"></td>
				</tr>
				<tr>
					<td align="center"><input class="s_btn" type="submit" value="로그인"></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="footer">
		<jsp:include page="../main/footer.jsp" flush="false" />
	</div>
</body>
</html>