<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="join_s.css">
<script>
	function fn_sendMember() {

		var frmMember = document.frmMember;
		var id = frmMember.ID.value;
		var pwd = frmMember.password.value;
		var name = frmMember.name.value;
		var email = frmMember.email_id.value;

		if (id.length == 0 || id == "") {
			alert("아이디입력은 필수입니다.");
		} else if (pwd.length == 0 || pwd == "") {
			alert("비밀번호 입력은 필수입니다.");
		} else if (name.length == 0 || name == "") {
			alert("이름 입력은 필수입니다.");
		} else if (email.length == 0 || email == "") {
			alert("이메일 입력은 필수입니다.");
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
		<div class="tit">회원가입</div>
		<form name="frmMember">
			<table>
				<tr>
					<td class="line" colspan="2">기본정보</td>
					<td style="text-align: right; font-size: 0.7em"><img
						src="check.jpg" width="15" height="15">표시 항목은 필수 입력 항목입니다.</td>

				</tr>
				<tr>
					<td><img src="check.jpg" width="25" height="25"></td>
					<th>이름</th>
					<td><input class="box" type="text" name="name"></td>
				</tr>
				<tr>
					<td><img src="check.jpg" width="25" height="25"></td>
					<th>아이디</th>
					<td><input class="box" type="text" name="ID"> <input
						class="btn" type="button" value="아이디중복확인"></td>
				</tr>
				<tr>
					<td><img src="check.jpg" width="25" height="25"></td>
					<th>비밀번호</th>
					<td><input class="box" type="password" name="password"></td>
				</tr>
				<tr>
					<td><img src="check.jpg" width="25" height="25"></td>
					<th>비밀번호확인</th>
					<td><input class="box" type="password" name="password"></td>
				</tr>
				<tr>
					<td><img src="check.jpg" width="25" height="25"></td>
					<th>이메일</th>
					<td><input class="box" type="text" name="email_id"> @
						<input class="box" type="text" name="email_host"> <select
						name="email_host_2">
							<option value="">--직접입력--</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
					</select></td>
				</tr>
				<tr>
					<td><img src="check.jpg" width="25" height="25"></td>
					<th>연락처</th>
					<td><select name="fst_num">
							<option value="">--선택--</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="070">070</option>
					</select> - <input class="box" type="text" name="scd_num" size=5> -
						<input class="box" type="text" name="trd_num" size=5></td>
				</tr>
				<tr>
					<td><img src="check.jpg" width="25" height="25"></td>
					<th>우편번호</th>
					<td><input class="box" type="text" name="address_num" size=10>
						<a target="_blank"
						href="https://www.epost.go.kr/search.RetrieveIntegrationNewZipCdList.comm"><input
							class="f_btn" type="button" value="주소검색"></a></td>
				</tr>
				<tr>
					<td><img src="check.jpg" width="25" height="25"></td>
					<th>주소</th>
					<td><input class="box" type="text" name="address" size=75>
				</tr>
				<tr>
					<td></td>
					<th>정보수신 여부</th>
					<td><input type="checkbox" name="Y_N" value="Email">
						Email로 수신 <input type="checkbox" name="Y_N2" value="SMS">
						SMS로 수신</td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input class="s_btn"
						type="submit" value="제출" onclick="fn_sendMember();"></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="footer">
		<jsp:include page="footer.jsp" flush="false" />
	</div>
</body>
</html>