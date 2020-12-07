<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO"%>
<jsp:useBean id="member" class="member.Member" scope="page" />
<jsp:setProperty name="member" property="id" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="../join/join_s.css">
<script>
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("../popup/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
	}

	function jusoCallBack(address) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.address.value = address;

	}
	
	function fn_sendMember() {

		var form = document.form;
		var id = form.id.value;
		var pwd = form.passwd.value;
		var r_pwd = form.r_passwd.value;
		var name = form.name.value;
		var email = form.email_id.value;
		var email_h = form.email_host.value;
		var f_num = form.fst_num.value;
		var s_num = form.scd_num.value;
		var t_num = form.trd_num.value;

		if (name.length == 0 || name == "") {
			alert("이름 입력은 필수입니다.");
			form.name.focus();
		} else if (id.length == 0 || id == "") {
			alert("아이디입력은 필수입니다.");
			form.id.focus();
		} else if (pwd.length == 0 || pwd == "") {
			alert("비밀번호 입력은 필수입니다.");
			form.passwd.focus();
		} else if (r_pwd.length == 0 || r_pwd == "") {
			alert("비밀번호 입력은 필수입니다.");
			form.r_passwd.focus();
		} else if (r_pwd != pwd) {
			alert("비밀번호가 일치하지 않습니다.");
			form.passwd.focus();
		} else if (email.length == 0 || email == "") {
			alert("이메일 입력은 필수입니다.");
			form.email_id.focus();
		} else if (email_h.length == 0 || email_h == "") {
			alert("이메일 입력은 필수입니다.");
			form.email_host.focus();
		} else if (f_num.length == 0 || f_num == "") {
			alert("연락처 입력은 필수입니다.");
			form.fst_num.focus();
		} else if (s_num.length == 0 || s_num == "") {
			alert("연락처 입력은 필수입니다.");
			form.scd_num.focus();
		} else if (t_num.length == 0 || t_num == "") {
			alert("연락처 입력은 필수입니다.");
			form.trd_num.focus();
		} else {
			form.target = "";
			form.method = "post";
			form.action = "join_db.jsp";
			form.submit();
		}
	}

	function email_change() {

		if (document.form.email_host_2.options[document.form.email_host_2.selectedIndex].value == "") {
			document.form.email_host.value = "";
			document.form.email_host.focus();
		} else {
			document.form.email_host.value = document.form.email_host_2.options[document.form.email_host_2.selectedIndex].value;
		}
	}

	function btn_click(str) {
		if (str == "submit") {
			form.method = "get";
			form.action = "join_fail.jsp";
			form.target = "param";
		} else if (str == "address") {
			form.action = goPopup();
		}

	}
</script>
</head>
<body>
	<div class="header">
		<jsp:include page="../main/header.jsp" flush="false" />
	</div>
	<div class="section">

		<div class="tit">회원가입</div>
		<form name="form" id="form">
			<table>
				<tr>
					<td class="line" colspan="2">기본정보</td>
					<td style="text-align: right; font-size: 0.7em"><img
						src="../image/g_chk.png" width="13" height="13"> 표시 항목은 필수
						입력 항목입니다.</td>

				</tr>
				<tr>
					<td><img src="../image/g_chk.png" width="15" height="15"></td>
					<th>이름</th>
					<td><input class="box" type="text" name="name"></td>
				</tr>
				<tr>
					<td><img src="../image/g_chk.png" width="15" height="15"></td>
					<th>아이디</th>
					<td><input class="box" type="text" name="id"></td>
				</tr>

				<tr>
					<td><img src="../image/g_chk.png" width="15" height="15"></td>
					<th>비밀번호</th>
					<td><input class="box" type="password" name="passwd"></td>
				</tr>
				<tr>
					<td><img src="../image/g_chk.png" width="15" height="15"></td>
					<th>비밀번호확인</th>
					<td><input class="box" type="password" name="r_passwd"></td>
				</tr>
				<tr>
					<td><img src="../image/g_chk.png" width="15" height="15"></td>
					<th>이메일</th>
					<td><input class="box" type="text" name="email_id"> @
						<input class="box" type="text" name="email_host"> <select
						name="email_host_2" onchange="email_change()">
							<option value="">--직접입력--</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
					</select></td>
				</tr>
				<tr>
					<td><img src="../image/g_chk.png" width="15" height="15"></td>
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
					<td></td>
					<th>주소</th>
					<td><input class="box" size=60 type="text" id="address"
						name="address" /> <input class="f_btn" type="button"
						onClick='btn_click("address");' value="주소검색" />
				</tr>
				<tr>
					<td class="line" colspan="2">부가정보</td>
					<td></td>

				</tr>
				<tr>
					<td></td>
					<th>생년월일</th>
					<td><input class="box" type="text" name="year" size=5>
						년 <select name="month">
							<option value="">--선택--</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
					</select> 월 <select name="day">
							<option value="">--선택--</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
					</select> 일</td>
				</tr>
				<tr>
					<td></td>
					<th>성별</th>
					<td><input type="radio" name="gender" value="male"> 남자
						<input type="radio" name="gender" value="female"> 여자</td>
				</tr>
				<tr>
					<td></td>
					<th>정보수신 여부</th>
					<td><input type="checkbox" name="y_n" value="Email">
						Email로 수신 <input type="checkbox" name="y_n2" value="SMS">
						SMS로 수신</td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input class="s_btn"
						type="submit" value="회원가입" onclick='btn_click("submit");'></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="footer">
		<jsp:include page="../main/footer.jsp" flush="false" />
	</div>
	<iframe id="if" name="param" style="visibility: hidden; display: none"></iframe>
</body>
</html>