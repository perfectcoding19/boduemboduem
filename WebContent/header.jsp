<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="header_s.css">
</head>
<body>
	<div class="hd">
		<div class="joinup">
			<ul>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
		</div>
			<h1>
				<a href="home.jsp">보듬보듬</a>
			</h1>
			<nav class="menu">
				<ul>
					<li><a href="introduce.jsp">소개</a></li>
					<li class="dropdown"><a class="dropbtn" href="">유기동물 공고</a>
						<div class="dropdown-content">
							<a href="">전체 공고</a> <a href="">보호중 공고</a>
						</div></li>
					<li><a href="">분실신고</a></li>
					<li class="dropdown"><a class="dropbtn" href="adopt_info.jsp">입양/습득시 안내</a>
						<div class="dropdown-content">
							<a href="adopt_info.jsp">입양안내</a> <a href="got_info.jsp">습득시 안내</a>
						</div></li>
					<li><a href="">센터(봉사)안내/입양후기</a></li>
					<li><a href="">공지사항</a></li>
				</ul>
			</nav>
		</div>
</body>
</html>