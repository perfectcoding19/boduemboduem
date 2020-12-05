<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>
</head>
<body>
		<% 
		        request.setCharacterEncoding("utf-8"); 
				String no = request.getParameter("no");
				String tempStart = request.getParameter("page");

		        Connection con;
				Statement stmt;
				ResultSet rs = null;
				
				request.setCharacterEncoding("utf-8"); 
		
				try {
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","kmj13999");
					
					stmt = con.createStatement();
					String sql = "select * from review where no = "+no;
					rs = stmt.executeQuery(sql);
					rs.next();
					
			    	out.print("<br>");
					out.print("<table width='100%'>");
			    	out.print("  <tr>");
			    	out.print("	   <td align='center'><img src='../image/"+rs.getString("image")+"'  width='350' height='400'></td>");
			    	out.print("  </tr>");
			    	out.print("  <tr>");
			    	out.print("	   <td align='center'><strong>"+rs.getString("title")+"</strong></td>");
			    	out.print("  </tr>");
			    	out.print("  <tr>");
			    	out.print("   <td align='center'>");
			    	out.print("     <div><p>");
			    	out.print("       <textarea cols='60' rows='20' style='border:none; resize: none; font-family: 맑은 고딕;' readonly='readonly'>");
			    	out.print(rs.getString("contents"));
			    	out.print("       </textarea></p>");
					out.print("     </div>");
					out.print("   </td>");
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
</body>
</html>