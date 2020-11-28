<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="header_s.css">
</head>
<body>
	<%
		String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
	%>
	<div class="hd">
		<h1>
			<a href="home.jsp">보듬보듬</a>
		</h1>

		<%
			if (id == null) {
		%>
		<div class="joinup">
			<ul>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
		</div>
		<%
			} else {
		%>
		<div class="joinup">
			<ul>
				<li><a href="logout_db.jsp">로그아웃</a></li>
				<li><a href="mypage.jsp">마이페이지</a></li>
			</ul>
		</div>
		<%
			}
		%>

		<nav class="menu">
			<ul>
				<li><a href="introduce.jsp">소개</a></li>
				<li class="dropdown"><a class="dropbtn" href="">유기동물 공고</a>
					<div class="dropdown-content">
						<a href="">전체 공고</a> <a href="Protecting_board.jsp">보호중 공고</a>
					</div></li>
				<li><a href="Lossreport_board.jsp">분실신고</a></li>
				<li class="dropdown"><a class="dropbtn" href="adopt_info.jsp">입양/습득시
						안내</a>
					<div class="dropdown-content">
						<a href="adopt_info.jsp">입양안내</a> <a href="got_info.jsp">습득시
							안내</a>
					</div></li>
				<li class="dropdown"><a class="dropbtn"
					href="review_adoption.jsp">봉사활동/입양후기</a>
					<div class="dropdown-content">
						<a href="">봉사활동</a> <a href="review_adoption.jsp">입양후기</a>
					</div></li>
				<li><a href="notice_list.jsp">공지사항</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>