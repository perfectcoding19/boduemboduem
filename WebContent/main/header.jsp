<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../main/header_s.css">
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
			<a href="../main/home.jsp">보듬보듬<img src="../image/h_dog.png" width="50" height="50"></a>
		</h1>

		<%
			if (id == null) {
		%>
		<div class="joinup">
			<ul>
				<li><a href="../login/login.jsp">로그인</a></li>
				<li><a href="../join/join.jsp">회원가입</a></li>
			</ul>
		</div>
		<%
			} else {
		%>
		<div style="margin-left:1205px;" class="joinup">
			<ul>
				<li><a href="../login/logout_db.jsp">로그아웃</a></li>
			</ul>
		</div>
		<%
			}
		%>

		<nav class="menu">
			<ul>
				<li class="none"><a href="../info/introduce.jsp">소개</a></li>
				<li class="dropdown"><a class="dropbtn" href="../Totalnotice/Totalnotice_board.jsp">유기동물 공고</a>
					<div class="dropdown-content">
						<a href="../Totalnotice/Totalnotice_board.jsp">공고</a> <a href="../Protecting/Protecting_board.jsp">보호중 동물</a>
					</div></li>
				<li class="none"><a href="../Lossreport/Lossreport_board.jsp">분실신고</a></li>
				<li class="dropdown"><a class="dropbtn" href="../info/adopt_info.jsp">입양/습득시
						안내</a>
					<div class="dropdown-content">
						<a href="../info/adopt_info.jsp">입양안내</a> <a href="../info/got_info.jsp">습득시
							안내</a>
					</div></li>
				<li class="dropdown"><a class="dropbtn"
					href="../review/review_list.jsp?type=volunteer">봉사활동/입양후기</a>
					<div class="dropdown-content">
						<a href="../review/review_list.jsp?type=volunteer">봉사활동 후기</a> <a href="../review/review_list.jsp?type=adoption">입양후기</a>
					</div></li>
				<li class="none"><a href="../notice/notice_list.jsp">공지사항</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>