<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보듬보듬</title>
<link rel="stylesheet" type="text/css" href="home_s.css">
</head>
<body>
	<div class="header">
		<jsp:include page="header.jsp" flush="false" />
	</div>
	<div class="section">
		<!--공고 슬라이더-->
		<jsp:include page="slide.jsp" flush="false" />
		
		<!--공지사항-->
		<div stlye="height:330px; width:5000px;">
			<table width='50%'>
				<tr height='40'>
					<td width='*'></td>
					<td width='500px'><br>
						<h3>공지사항</h3> <br>
						<hr color="#AACE55"></td>
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

				sql = " set @rownum := 0 ";
				stmt.executeUpdate(sql);
				sql = " select bb.*";
				sql = sql + " from (";
				sql = sql + " select @rownum := @rownum + 1 as idx,";
				sql = sql + "           aa.*";
				sql = sql + " from (";
				sql = sql + " select * from notice";
				sql = sql + " order by no desc";
				sql = sql + " ) aa";
				sql = sql + " ) bb";
				sql = sql + " where idx limit 0, 5";
				//out.print("sql : " + sql);
				rs = stmt.executeQuery(sql);

				out.print("<table width='50%'>");
				out.print("  <tr height='40'>");
				out.print("     <td width='*'></td>");
				out.print("     <td width='500px'>");
				while (rs.next()) {
					out.print("<table width='100%'>");
					out.print("  <tr height='40'>");
					out.print("    <td width='100%'><a href='javascript:notice_read(" + rs.getString("no") + ");'>"
					+ rs.getString("title") + "</a></td>");
					out.print("  </tr>");
					out.print("</table>");
					out.print("<hr color='#D5D5D5'>");
				}
				out.print("     </td>");
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
			<form id="form1" action="../notice/notice_read.jsp" method="post">
				<input type=hidden id="no" name="no" value=""> <input
					type=hidden name="page" value="1"> <input type=hidden
					name="searchColumn" value="title"> <input type=hidden
					name="keyword" value="">
			</form>
		</div>
	</div>
	<div class="footer">
		<jsp:include page="footer.jsp" flush="false" /></div>
</body>
</html>
