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
<style>
#logo{
font-size:40px;font-family:"나눔고딕";font-color:black;
margin-left: 15px; margin-top:20px;
width:180px; height:50px; border:2px solid white; background-color:white; text-align:center;}
#notice{
margin-left:150px; margin-top:40px; font-family:"나눔고딕"; font-size:30px;font-weight:bold
}
#search{ 
text-align:right;
}
#button{float:right; border:2px solid #808080; background: white; padding: 0 30px;font-family:"나눔고딕";}
.main{ 
   margin-top: 30px;
   display:inline-block;
    width: 70%;
    height: 500px;
    align-content: center;
    align-items: center;
    margin-left: 15%;
    margin-right: 15%
}
.sub{ 
    height: 200px;
    float: left;
    width: 49.85%;
    padding-bottom: 30px;
}
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
   
   String sql2 = "select COUNT(*) from protecting;";
   pstmt = conn.prepareStatement(sql2);
   rs3 = pstmt.executeQuery();
   if(rs3.next()){
      total = rs3.getInt(1);
   }
      
   String sql = "select * from protecting order by idx desc;";
   pstmt  = conn.prepareStatement(sql);
   rs2 = pstmt.executeQuery();
   
   

%>
<div id="notice">보호중 공고</div>
 <div id="search">
  <form>
    <select name="num1">
     <option value="제목">제목</option>
     <option value="작성자">작성자</option>
     <option value="날짜">날짜</option>
     <option value="유기동물 종류">유기동물 종류</option>
    </select>
    
     <input type="text" size="20" name="num2" placeholder="검색어를 입력하세요."/>
     <input type="button" size="20"value="검색"/>
   </form>
  </div>
<hr width="100%" color=#808080 size="2">

<div class="main">
   <%
   while(rs2.next()){
      
   
   %>
    <div class="sub">
	    <div style="border: 1px solid; width: 40%; height: 80%; float: left;">
	    <img alt="" src="images/<%=rs2.getString("filename") %>" style="width: 100%; height: 100%"/></div>
	    <div style="height: 18%">• 품종: <%=rs2.getString("variety") %></div> 
	    <div style="height: 18%">• 나이: <%=rs2.getString("old") %></div> 
	    <div style="height: 18%">• 성별: <%=rs2.getString("sex") %></div> 
        <div style="height: 18%">• 보호 지역: <%=rs2.getString("protectplace") %></div>
        <div style="height: 18%">• 보호시작 날짜: <%=sf.format(nowTime)%></div>
	</div>
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

 <button id="button" onclick="location.href='Protecting_write.jsp'" style="margin-top: 200px;">글쓰기</button>
</div> 
<div>

</div>

</body>
</html>