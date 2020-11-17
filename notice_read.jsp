<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	ul {
			list-style:none;
			margin:0;
			padding:0;
			text-align:center;
	}
	li {
			margin: 0 0 0 0;
			padding: 0 0 0 0;
			border:0;
			display:inline-block;
	}
</style>
<title>공지사항</title>
</head>
<body>
		<% 
				request.setCharacterEncoding("utf-8"); 
				String title = request.getParameter("name");
				String id= request.getParameter("id");
				String passwd= request.getParameter("passwd");
		%>

		<h1>공지사항</h1>
		<h4>보듬보듬의 신규 및 업데이트 소식을 알려드립니다.</h4>
		<hr color="#0D3EA3">
		<table width="100%">
				<tr>
					<td width="76.66%" align="center"><b>제목</b></td>
					<td width="10%" align="center"><b>작성일</b></td>
					<td width="6.67%" align="center"><b>조회수</b></td>
				</tr>
		</table>
		<hr color="#0D3EA3">
		<table width="100%">
				<tr>
					<td width="76.66%"><b>제목입니다1</b></td>
					<td width="10%" align="center">2020-11-15</td>
					<td width="6.67%" align="center">48</td>
				</tr>
		</table>
		<hr color="#D5D5D5">
		<div><p>
			<textarea cols="100%" rows="10" style="border:none; resize: none; " readonly="readonly">
안녕하세요. 보듬보듬의 새로운 소식을 알려드립니다.
유기동물의 입양후기를 볼 수 있는 게시판이 생겼습니다.
많은 관심과 이용 부탁드립니다.
			</textarea></p>
		</div>
		<div align="center">
				<input type="button" onclick="location.href='notice_list.jsp'" value="목록">
		</div>
</body>
</html>