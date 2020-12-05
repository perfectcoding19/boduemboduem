<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="home_s.css">
</head>
<body>
	<div class="section">

		<% 
			request.setCharacterEncoding("utf-8"); 
			String no = request.getParameter("no");
		%>
   
    	<form>		
			<table width="100%">
				<tr height="40">
        			<td width="10%"></td>
        			<td width="80%">
						<br>
						<h1>공지사항</h1>
						<br>
						<h4>보듬보듬의 신규 및 업데이트 소식을 알려드립니다.</h4>
						<br>
						<hr color="#AACE55">
						<table width="100%">
							<tr height="40">
								<td width="70%" align="center"><b>제목</b></td>
								<td width="15%" align="center"><b>작성일</b></td>
								<td width="15%" align="center"><b>조회수</b></td>
							</tr>
						</table>
						<hr color="#AACE55">
        			</td>
        			<td width="10%"></td>
				</tr>
			</table>
			
			<% 
				Connection con;
				Statement stmt;
				ResultSet rs = null;
				
				request.setCharacterEncoding("utf-8"); 
		
				try {
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","kmj13999");
					
					stmt = con.createStatement();
					String sql = "select * from notice where no = "+no;
					rs = stmt.executeQuery(sql);
					rs.next();
					
			    	out.print("<table width='100%'>");
			    	out.print("  <tr height='40'>");
			    	out.print("     <td width='10%'></td>");
			    	out.print("     <td width='80%'>");
					out.print("			<table width='100%'>");
			    	out.print("  			<tr height='40'>");
			    	out.print("    				<td width='70%'><b>"+rs.getString("title")+"</b></td>");
			    	out.print("    				<td width='15%' align='center'>"+rs.getString("cre_date")+"</td>");
			    	out.print("	   				<td width='15%' align='center'>"+rs.getString("views")+"</td>");
			    	out.print("  			</tr>");
			    	out.print("			</table>");
			    	out.print("			<hr color='#D5D5D5'>");
			    	out.print("			<br>");
			    	out.print("			<div><p>");
			    	out.print("				<textarea name = 'contents' rows='25'' style='width:100%; border:none; resize: none;' >");
			    	out.print(rs.getString("contents"));
			    	out.print("				</textarea></p>");
					out.print("			</div>");
			    	out.print("			<hr color='#D5D5D5'>");
			    	out.print("			<br>");
			    	out.print("     </td>");
			    	out.print("     <td width='10%'></td>");
			    	out.print("  </tr>");
			    	out.print("</table>");

					sql = "update notice set views = views + 1 where no = "+no;
					stmt.executeUpdate(sql);

					rs.close();
					stmt.close();
					con.close();
				} catch (SQLException e1) {
					out.print("SQLException : " + e1);
				} catch (Exception e) {
					out.print("Exception : " + e);
				}
			%>
    	</form>
	</div>
</body>
</html>