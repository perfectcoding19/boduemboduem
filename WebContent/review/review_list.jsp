<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>
<link rel="stylesheet" type="text/css" href="../main/home_s.css">
</head>
<body>
	<script>
		var _width = 800;
		var _height = 600;
		var _left = Math.ceil((screen.width - _width) / 2);
		var _top = Math.ceil((screen.height - _height) / 2);

		function popup_read_open(no) {
			window.open("review_popup_read.jsp?no=" + no, "new", "width="
					+ _width + ",height=" + _height + ",top=" + _top + ",left="
					+ _left + ", scrollbars=no");
		}

		function popup_write_open(pageType) {
			window.open("review_popup_write.jsp?type=" + pageType, "new",
					"width=" + _width + ",height=" + _height + ",top=" + _top
							+ ",left=" + _left + ", scrollbars=no");
		}
		function review_list(tempStart) {
			document.getElementById('page').setAttribute('value', tempStart);
			document.getElementById('form1').submit();
		}
	</script>

	<div class="header">
		<jsp:include page="../main/header.jsp" flush="false" />
	</div>

	<%
		String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
	%>

	<div class="section">

		<%
			String pageType = request.getParameter("type");
		String Desc1 = "";
		String Desc2 = "";
		if (pageType.equals("volunteer")) {
			Desc1 = "봉사활동";
			Desc2 = "보듬보듬 회원님들의 소중한 봉사활동 후기입니다.";
		} else {
			Desc1 = "입양";
			Desc2 = "보듬보듬 회원님들의 소중한 입양 후기입니다.";
		}

		String tempStart = request.getParameter("page");
		int startIdx = 0;
		int rowCnt = 8;

		if (tempStart != null) {
			startIdx = (Integer.parseInt(tempStart) - 1) * rowCnt;
		} else {
			tempStart = "1";
		}
		%>

		<form id="form1" action="review_list.jsp" method="post">
			<input type=hidden id="type" name="type" value="<%=pageType%>">
			<input type=hidden id="page" name="page" value="">
		</form>

		<form>
			<table style="position: relative; left: 40px;" width='95%'>
				<tr height='40'>
					<td width='15%'></td>
					<td width='70%'>
						<div style="font-size: 30px; margin-bottom: 5px;" class="title">
							<%=Desc1%>
							후기
						</div>
						<table width="100%">
							<tr>
								<td style="font-size: 15px;" width="70%"><%=Desc2%></td>
								<td width="30%" align="right">
									<%
										if (id == null) {
									%>
									<div></div> <%
 	} else {
 %>
									<div>
										<input
											style="border: 0; background: #c7d696; border-radius: 5px; width: 60px; height: 20px; cursor: pointer;"
											type="button" onclick="popup_write_open('<%=pageType%>');"
											value="글작성">
									</div> <%
 	}
 %>
								</td>
							</tr>
						</table>
						<hr style="margin-top: 15px;" width="100%" color=#c7d696 size="2">

						<div>
							<table width="100%">

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

									sql = " select count(*) from review";
									sql = sql + " where type ='" + Desc1 + "'";
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
									sql = sql + " select * from review";
									sql = sql + " where type = '" + Desc1 + "'";
									sql = sql + " order by no desc";
									sql = sql + " ) aa";
									sql = sql + " ) bb";
									sql = sql + " where idx limit " + startIdx + ", " + rowCnt;
									//out.print("sql : " + sql);
									rs = stmt.executeQuery(sql);

									int img_cnt = 4;
									int ii = 1;

									while (rs.next()) {
										if (ii == 1) {
									out.print("<tr>");
										}
										out.print("<td width='25%' align='center'>");
										out.print("   <table width='100%'>");
										out.print("		<tr>");
										out.print("			<td align='center'><img src='../image/" + rs.getString("image")
										+ "' width='240' height='240'");
										out.print("			   onclick='popup_read_open(" + rs.getString("no") + ")' style='cursor:pointer'> </td>");
										out.print("		</tr>");
										out.print("		<tr>");
										out.print("			<td align='center'> <strong>" + rs.getString("title") + "</strong></td>");
										out.print("		</tr>");
										out.print("		<tr>");
										out.print("			<td align='center'>");
										out.print(
										"				<textarea cols='25%' rows='2' style='border:none; resize: none; overflow:hidden; font-family: 맑은 고딕;' readonly='readonly'>");
										out.print(rs.getString("contents"));
										out.print("				</textarea>");
										out.print("			</td>");
										out.print("		</tr>");
										out.print("	</table>");
										out.print("</td>");
										if (ii == img_cnt) {
									out.print("</tr>");
									ii = 1;
										} else {
									ii++;
										}
									}
									if (ii > 1) {
										for (int jj = ii; jj <= img_cnt; jj++) {
									out.print("<td width='25%' align='center'>");
									out.print("   <table width='100%'>");
									out.print("		<tr>");
									out.print("			<td> </td>");
									out.print("		</tr>");
									out.print("		<tr>");
									out.print("			<td> </td>");
									out.print("		</tr>");
									out.print("		<tr>");
									out.print("			<td>");
									out.print(
											"				<textarea cols='25%' rows='2' style='border:none; resize: none; overflow:hidden;' readonly='readonly'>");
									out.print("				</textarea>");
									out.print("			</td>");
									out.print("		</tr>");
									out.print("	</table>");
									out.print("</td>");
										}
										out.print("</tr>");
									}

									rs.close();
									stmt.close();
									con.close();
								} catch (SQLException e1) {
									out.print("SQLException : " + e1);
								} catch (Exception e) {
									out.print("Exception : " + e);
								}
								%>

							</table>
							<hr color="#c7d696">
						</div>
					</td>
					<td width='15%'></td>
				</tr>
			</table>

			<table width='100%'>
				<tr>
					<td align="center">
						<%
							for (int i = 1; i <= count; i++) {
						%> <a style="color: black;" href='javascript:review_list(<%=i%>);'><%=i%>
					</a> <%
 	}
 ;
 %>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div class="footer">
		<jsp:include page="../main/footer.jsp" flush="false" />
	</div>

</body>
</html>