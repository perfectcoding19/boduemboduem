<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보듬보듬</title>
<link rel="stylesheet" type="text/css" href="../main/home_s.css">
</head>
<script>
	function notice_read(no) {
		document.getElementById('no').setAttribute('value', no);
		document.getElementById('form1').submit();
	}
</script>
<body>
	<div class="header">
		<jsp:include page="../main/header.jsp" flush="false" />
	</div>
	<div class="section">
		<!--공고 슬라이더-->
		<jsp:include page="../main/slide.jsp" flush="false" />

		<!--공지사항-->
		<div class="notice">
			<table width='50%'>
				<tr height='40'>
					<td width='*'></td>
					<td width='500px'><br>
						<h3>공지사항</h3>
						<hr color="#c7d696"></td>
				</tr>
			</table>
			<%
				Connection con;
			Statement stmt;
			Statement stmt1;
			Statement stmt2;
			Statement stmt3;
			ResultSet rs = null;
			ResultSet rs1 = null;
			ResultSet rs2 = null;
			ResultSet rs3 = null;
			String sql = "";
			String sql1 = "";
			String sql2 = "";
			String sql3 = "";

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
					out.print("    <td width='100%'><a style='color:black;margin-left:5px;' href='javascript:notice_read("
					+ rs.getString("no") + ");'>" + rs.getString("title") + "</a></td>");
					out.print("  </tr>");
					out.print("</table>");
					out.print("<hr color='#D5D5D5'>");
				}
				out.print("     </td>");
				out.print("  </tr>");
				out.print("</table>");
			%>
			<form id="form1" action="../notice/notice_read.jsp" method="post">
				<input type=hidden id="no" name="no" value=""> <input
					type=hidden name="page" value="1"> <input type=hidden
					name="searchColumn" value="title"> <input type=hidden
					name="keyword" value="">
			</form>

		</div>
		<div class="situat">
			<%
				int resc = 0;
			sql1 = "SELECT rescued FROM situation";
			stmt1 = con.createStatement();
			rs1 = stmt1.executeQuery(sql1);

			while (rs1.next()) {
				resc = rs1.getInt(1);
			%>
			<table class="situat_t">
				<tr>
					<td class="situ_num">구조된 동물</td>
					<td class="s_num"><%=resc%>마리</td>
				</tr>
				<%
					}
				%>

				<%
					int adop = 0;
				sql2 = "SELECT adoption FROM situation";
				stmt2 = con.createStatement();
				rs2 = stmt2.executeQuery(sql2);

				while (rs2.next()) {
					adop = rs2.getInt(1);
				%>
				<tr>
					<td class="situ_num">입양률</td>
					<td class="s_num"><%=adop * 100 / resc%>%</td>
				</tr>

				<%
					}
				%>
				<%
					int euth = 0;
				sql3 = "SELECT euthanasia FROM situation";
				stmt3 = con.createStatement();
				rs3 = stmt3.executeQuery(sql3);

				while (rs3.next()) {
					euth = rs3.getInt(1);
				%>
				<tr>
					<td class="situ_num">안락사율</td>
					<td class="s_num"><%=euth * 100 / resc%>%</td>
				</tr>

				<%
					}
				%>
			</table>
			<%
				con.close();
			rs.close();
			stmt.close();

			} catch (SQLException e1) {
			out.print("SQLException : " + e1);
			} catch (Exception e) {
			out.print("Exception : " + e);
			}
			%>
		</div>
		<div class="call">
			<table class="t_call">
				<tr>
					<td rowspan="4"><img class="img" width=80px height=80px src="../image/phone.png"></td>
				
					<td class="word">동물보호 상담센터</td>
				</tr>
				<tr>
					<td class="word">1577-0954</td>
				</tr>
				<tr>
					<td class="word">상담시간 : 평일 09:00 ~ 18:00</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="footer">
		<jsp:include page="../main/footer.jsp" flush="false" /></div>
</body>
</html>