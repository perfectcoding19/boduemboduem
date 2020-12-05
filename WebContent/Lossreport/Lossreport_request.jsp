<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 

request.setCharacterEncoding("utf-8");
String path = request.getRealPath("image");


int size = 1024 * 1024 * 10; // 저장가능한 파일 크기
String file = ""; 
String originalFile = "";

try{
    MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

    Enumeration files = multi.getFileNames();
    String str = (String)files.nextElement();

    file = multi.getFilesystemName(str);
    originalFile = multi.getOriginalFileName(str);
   
    
    String variety= multi.getParameter("variety");
    String variety1= multi.getParameter("variety1");
    String old=multi.getParameter("old");
    String place= multi.getParameter("place");
    String place1= multi.getParameter("place1");
    String place2= multi.getParameter("place2");
    String day = multi.getParameter("day");
    String feature = multi.getParameter("feature");
    String callnumber = multi.getParameter("call");
    String sex = multi.getParameter("sex1");

    Connection conn = null;
    PreparedStatement pstmt = null;


    Class.forName("com.mysql.jdbc.Driver");
    String url = "";
    String user = "";
    String pw = "";
    try{
    	url = "jdbc:mysql://localhost:3306/mydb?useSSL=false&useUnicode=true&characterEncoding=UTF-8";
    	user = "root";
    	pw = "2634"; 
    	conn = DriverManager.getConnection(url,user,pw);
    	
    	String sql = "insert into lossreport(variety, variety1, sex, old, place, place1, place2, day, feature, callnumber,filename) values('"+variety+"','"+variety1+"','"+sex+"','"+old+"','"+place+"','"+place1+"','"+place2+"','"+day+"','"+feature+"','"+callnumber+"','"+originalFile+"');";
    	pstmt  = conn.prepareStatement(sql);
    	pstmt.executeUpdate();
    	
	} catch(SQLException ex) {
        out.println(ex.getMessage());
        ex.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
}catch(Exception e2){
	e2.printStackTrace();
}

	response.sendRedirect("Lossreport_board.jsp");
%>
</body>
</html>