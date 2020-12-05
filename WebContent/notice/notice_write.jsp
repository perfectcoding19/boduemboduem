<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,java.sql.*" %> 
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
	* {
	margin: 0;
	padding: 0;
	font-family: 맑은 고딕;
}
</style>
<title>notice save</title>
</head>
<body>
		<% 
				request.setCharacterEncoding("utf-8"); 
				String no = request.getParameter("no");
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");

				Connection con;
				Statement stmt;
				
				request.setCharacterEncoding("utf-8"); 
		
				try {
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","kmj13999");
					
					stmt = con.createStatement();
					String sql = "update notice set title = '"+title+"', contents = '"+contents+"' where no = "+no;
					out.print(sql);
					stmt.executeUpdate(sql);

					stmt.close();
					con.close();
				} catch (SQLException e1) {
					out.print("SQLException : " + e1);
				} catch (Exception e) {
					out.print("Exception : " + e);
				}
				response.sendRedirect("notice_list.jsp");
		%>
</body>
</html>