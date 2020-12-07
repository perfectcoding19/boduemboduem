<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
ul {
	list-style: none;
	margin: 0;
	padding: 0;
	text-align: center;
}

li {
	margin: 0 0 0 0;
	padding: 0 0 0 0;
	border: 0;
	display: inline-block;
}
</style>
<title>notice save</title>
</head>
<body>
	<%
		String realFolder = "";
	String filename1 = "";
	int maxSize = 1024 * 1024 * 5;
	String encType = "UTF-8";
	String savefile = "image";
	ServletContext scontext = getServletContext();
	realFolder = scontext.getRealPath(savefile);

	Connection con;
	Statement stmt;

	try {
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		Enumeration<?> files = multi.getFileNames();
		String file1 = (String) files.nextElement();
		filename1 = multi.getFilesystemName(file1);
		String pageType = multi.getParameter("type");
		String Desc1 = "";
		String Desc2 = "";
		if (pageType.equals("volunteer")) {
			Desc1 = "봉사활동";
		} else {
			Desc1 = "입양";
		}
		String title = multi.getParameter("title");
		String contents = multi.getParameter("contents");
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/boduemdb?useSSL=false", "root", "seoyeon001");

		stmt = con.createStatement();
		String sql = "insert into review(type,image, title, contents) values('" + Desc1 + "','" + filename1 + "','" + title
		+ "','" + contents + "')";
		//out.print(sql);
		stmt.executeUpdate(sql);
		stmt.close();
		con.close();
	} catch (SQLException e1) {
		out.print("SQLException : " + e1);
	} catch (Exception e) {
		out.print("Exception : " + e);
	}

	//response.sendRedirect("review_adoption.jsp");
	StringBuffer sb1 = new StringBuffer();
	sb1.append("<script type='text/javascript'>");
	sb1.append("opener.parent.location.reload();");
	sb1.append("window.close();");
	sb1.append("</script>");
	response.setContentType("text/html; charset=UTF-8");
	PrintWriter out1 = response.getWriter();
	out1.println(sb1);
	out1.flush();
	%>
</body>
</html>