<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   Date nowTime=new Date();
   SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th{border-bottom:2px solid #c7d696; background:white; text-align:left; font-size:18px; font-family:"맑은 고딕"; color:balck;}
td{border-bottom:2px solid #c7d696; text-align:left; font-size:15px;font-family:"맑은 고딕"; color:balck;}
#notice{
margin-left:150px; margin-top:40px; font-family:"맑은 고딕"; font-size:30px;font-weight:bold
}
table{width:600px; height:800px; margin:auto; text-align:center; border:1px soild #c7d696;
}
#h1{font-family:"맑은 고딕"; font-size:15px; margin-right:100px; float:right;}
</style>
</head>
<body>
<%
Connection conn = null;
PreparedStatement pstmt = null;
Class.forName("com.mysql.jdbc.Driver");
String url = "";
String user = "";
String pw = "";
int total = 0;
ResultSet rs2 = null;
ResultSet rs3 = null;
try{
   url = "jdbc:mysql://localhost:3306/mydb?useSSL=false";
   user = "root";
   pw = "2634"; 
   conn = DriverManager.getConnection(url,user,pw);
   
   String sql2 = "select COUNT(*) from lossreport;";
   pstmt = conn.prepareStatement(sql2);
   rs3 = pstmt.executeQuery();
   if(rs3.next()){
      total = rs3.getInt(1);
   }
   
   String idx = request.getParameter("no");
   
   String where = " AND idx =" + idx;
      
   String sql = "select * from lossreport WHERE 1=1"+where+";";
   pstmt  = conn.prepareStatement(sql);
   rs2 = pstmt.executeQuery();
   
   
%>
<%
   while(rs2.next()){
      
   
   %>
   <img alt="" src="../image/<%=rs2.getString("filename") %>" style="width: 500px; height: 350px; margin-left:130px;"/>
<table>
<tr>
  <th>• 품종</th>
  <td> <%=rs2.getString("variety") %> > <%=rs2.getString("variety1")%> </td>
 </tr>
 <tr>
 <th>• 성별</th>
 <td> <%=rs2.getString("sex") %> </td>
 </tr>
 <tr>
   <th>• 나이</th>
     <td> <%=rs2.getString("old") %> </td>
 </tr>
 <tr>
   <th>• 분실 장소</th>
   <td> <%=rs2.getString("place") %> <%=rs2.getString("place1")%> <%=rs2.getString("place2")%> </td>
 </tr>
 <tr>
   <th>• 분실 날짜</th>
     <td> <%=rs2.getString("day")%> </td>
 </tr>
 <tr>
 <th>• 특징</th>
   <td>  <%=rs2.getString("feature")%> </td>
 </tr>
<tr>
<th>• 문의전화</th>
  <td>  <%=rs2.getString("callnumber")%>  </td>
</tr>
</table>
<%    
   }
    } catch(SQLException ex) {
        out.println(ex.getMessage());
        ex.printStackTrace();
    } finally {
        if (rs2 != null) try { rs2.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>   
<br>
</body>
</html>