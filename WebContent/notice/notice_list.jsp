<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="../main/home_s.css">
</head>
<body>

	<script type="text/javascript">
		function notice_list(tempStart) {
			document.getElementById('page').setAttribute('value', tempStart);
			document.getElementById('form2').submit();
		}
		function notice_read(no) {
			document.getElementById('no').setAttribute('value', no);
			document.getElementById('form1').submit();
		}
	</script>

	<div class="header">
		<jsp:include page="../main/header.jsp" flush="false" />
	</div>

	<div class="section">

		<%
			request.setCharacterEncoding("utf-8");
		String searchColumn = request.getParameter("searchColumn");
		if (searchColumn == null) {
			searchColumn = "title";
		}
		//out.print("searchColumn : " + searchColumn);
		String keyword = request.getParameter("keyword");
		if (keyword == null) {
			keyword = "";
		}
		//out.print("keyword : " + keyword);
		String tempStart = request.getParameter("page");
		int startIdx = 0;
		int rowCnt = 8;

		if (tempStart != null) {
			startIdx = (Integer.parseInt(tempStart) - 1) * rowCnt;
		} else {
			tempStart = "1";
		}
		%>

		<form id="form1" action="notice_read.jsp" method="post">
			<input type=hidden id="no" name="no" value=""> <input
				type=hidden name="page" value="<%=tempStart%>"> <input
				type=hidden name="searchColumn" value="<%=searchColumn%>">
			<input type=hidden name="keyword" value="<%=keyword%>">
		</form>

		<table>
			<tr height='40'>
				<td width='15%'></td>
				<td width='58%'><br>
					<div style="font-size: 30px; margin-bottom: 5px;" class="title">
						공지사항</div>

					<div style="font-size: 15px;">보듬보듬의 신규 및 업데이트 소식을 알려드립니다.</div>
					<hr style="margin-top: 15px;" width="100%" color=#c7d696 size="2">
					<table width="100%">
						<tr height="40">
							<td width="7%" align="center"><b>번호</b></td>
							<td width="73%" align="center"><b>제목</b></td>
							<td width="10%" align="center"><b>작성일</b></td>
							<td width="10%" align="center"><b>조회수</b></td>
						</tr>
					</table>
					<hr color=#D5D5D5>
				</td>
				<td width='15%'></td>
			</tr>
		</table>
		<%
			Connection con;
		Statement stmt;
		ResultSet rs = null;
		String sql = "";
		int count = 0;

		request.setCharacterEncoding("utf-8");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/boduemdb?useSSL=false", "root", "seoyeon001");

			stmt = con.createStatement();

			sql = " select count(*) from notice";
			if (keyword != null) {
				if (searchColumn.equals("title")) {
			sql = sql + " where title like '%" + keyword + "%'";
				} else if (searchColumn.equals("contents")) {
			sql = sql + " where contents like '%" + keyword + "%'";
				}
			}
			//out.print("sql : " + sql);
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				count = rs.getInt(1);
				count = (int) Math.ceil((double) count / (double) rowCnt);
			}
			sql = " set @rownum := 0 ";
			stmt.executeUpdate(sql);
			sql = " select bb.*";
			sql = sql + " from (";
			sql = sql + " select @rownum := @rownum + 1 as idx,";
			sql = sql + "           aa.*";
			sql = sql + " from (";
			sql = sql + " select * from notice";
			if (keyword != null) {
				if (searchColumn.equals("title")) {
			sql = sql + " where title like '%" + keyword + "%'";
				} else if (searchColumn.equals("contents")) {
			sql = sql + " where contents like '%" + keyword + "%'";
				}
			}
			sql = sql + " order by no desc";
			sql = sql + " ) aa";
			sql = sql + " ) bb";
			sql = sql + " where idx limit " + startIdx + ", " + rowCnt;
			//out.print("sql : " + sql);
			rs = stmt.executeQuery(sql);

			out.print("<table width='100%'>");
			out.print("  <tr height='40'>");
			out.print("     <td width='15%'></td>");
			out.print("     <td width='58%'>");
			while (rs.next()) {
				out.print("<table width='100%'>");
				out.print("  <tr height='40'>");
				out.print("    <td width='7%' align='center'>" + rs.getString("no") + "</td>");
				out.print("    <td width='73%'><a style='color:black;' href='javascript:notice_read(" + rs.getString("no")
				+ ");'>" + rs.getString("title") + "</a></td>");
				out.print("    <td width='10%' align='center'>" + rs.getString("cre_date") + "</td>");
				out.print("	   <td width='10%' align='center'>" + rs.getString("views") + "</td>");
				out.print("  </tr>");
				out.print("</table>");
				out.print("<hr color='#D5D5D5'>");
			}
			out.print("     </td>");
			out.print("     <td width='15%'></td>");
			out.print("  </tr>");
			out.print("</table>");

			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e1) {
			out.print("SQLException : " + e1);
		} catch (Exception e) {
			out.print("Exception : " + e);
		}
		%>

		<table width='100%'>
			<tr>
				<td align="center">
					<%
						for (int i = 1; i <= count; i++) {
					%> <a style="color: black;" href='javascript:notice_list(<%=i%>);'><%=i%></a>
					<%
						}
					;
					%>
				</td>
			</tr>
		</table>

		<div align="center">
			<br>
			<form id="form2" action="notice_list.jsp" method="post">
				<input type=hidden id="page" name="page" value="<%=tempStart%>">
				<div>
					<table width='100%'>
						<tr>
							<td align="center"><label for="searchColumn">검색</label> <select
								name="searchColumn" id="searchColumn" title="검색구분 선택">
									<option
										<%if (searchColumn.equals("title")) {
	out.print("selected");
}%>
										value="title">제목</option>
									<option
										<%if (searchColumn.equals("contents")) {
	out.print("selected");
}%>
										value="contents">내용</option>
							</select> <input type="text" name="keyword" id="keyword" class="w300"
								maxlength="50" title="검색어 입력" value="<%=keyword%>" /> <input
								style="border-radius: 5px; border: 2px solid #c7d696; background: #c7d696; font-size: 13px; cursor: pointer;" type="button" value="조회" onclick="notice_list('1')"></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>

	<div class="footer">
		<jsp:include page="../main/footer.jsp" flush="false" />
	</div>

</body>
</html>