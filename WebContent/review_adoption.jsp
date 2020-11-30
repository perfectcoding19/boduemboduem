<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
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
	
	a:link {text-decoration:none; color:black;}
	a:visited {text-decoration:none; color:black;}
	a:hover {text-decoration:none; color:black;}
	a:active {text-decoration:none; color:black;}

</style>
<script type="text/javascript">
    function review_adoption(tempStart) {
    	document.getElementById('page').setAttribute('value',tempStart);
    	document.getElementById('form1').submit();
    }
</script>
<title>입양후기</title>
</head>
<body>
<script type="text/javascript">
    var _width = 800;
    var _height = 600;

    var _left = Math.ceil((screen.width - _width ) / 2);
    var _top = Math.ceil((screen.height - _height ) / 2);
    
    function popup_open(no) {
    	window.open(
    	"review_popup.jsp?no="+no,
    	"new",
    	"width="+_width+",height="+_height+",top="+_top+",left="+_left+", scrollbars=no");
    }
    
    function popup_write_open() {
    	window.open(
    	"review_popup_write.jsp",
    	"new",
    	"width="+_width+",height="+_height+",top="+_top+",left="+_left+", scrollbars=no");
    }    

</script>
<% 
				String tempStart = request.getParameter("page");
				int startIdx = 0;
				int rowCnt = 8;
				
				if (tempStart != null) {
					startIdx = (Integer.parseInt(tempStart) - 1) * rowCnt;
				} else {
					tempStart = "1";
				}
%>
<form id = "form1" action="review_adoption.jsp" method="post">		
       <input type=hidden id="page"  name ="page"  value="">
</form>
<form>
		<h1>입양 후기</h1>
		<h4>보듬보듬 회원님들의 소중한 입양 후기입니다.</h4>
		<div align="right">
		<input type="button" onclick="popup_write_open()" value="글작성">
		</div>
		<hr color="#0D3EA3">
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
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","kmj13999");
					
					stmt = con.createStatement();
										
					sql = " select count(*) from review";
					sql = sql + " where type = '입양'";
					//out.print("sql : " + sql);
					rs = stmt.executeQuery(sql);
					if(rs.next()) {
						count = rs.getInt(1);
						count = (int)Math.ceil((double)count / (double)rowCnt);
					}

					sql = " set @rownum := 0 ";
					stmt.executeUpdate(sql);

					        sql = " select bb.*";
					sql = sql + " from (";
					sql = sql + " select @rownum := @rownum + 1 as idx,";
					sql = sql + "           aa.*";
					sql = sql + " from (";
					sql = sql + " select * from review";
					sql = sql + " where type = '입양'";
					sql = sql + " order by no desc";
					sql = sql + " ) aa";
					sql = sql + " ) bb";
					sql = sql + " where idx limit "+startIdx+", "+rowCnt;
					//out.print("sql : " + sql);
					rs = stmt.executeQuery(sql);
					
					int img_cnt = 4;
					int ii = 1;
					
				    while(rs.next()) {
				    	if (ii == 1) {
				    	    out.print("<tr>");
				    	}
				    	out.print("<td width='25%' align='center'>");
				    	out.print("   <table width='100%'>");
				    	out.print("		<tr>");
				    	out.print("			<td align='center'><img src='image/"+rs.getString("image")+"' width='250' height='300'"); 
				    	out.print("			   onclick='popup_open("+rs.getString("no")+")' style='cursor:pointer'> </td>"); 
				    	out.print("		</tr>");
				    	out.print("		<tr>");
				    	out.print("			<td align='center'> <strong>"+rs.getString("title")+"</strong></td>"); 
				    	out.print("		</tr>");
				    	out.print("		<tr>");
				    	out.print("			<td align='center'>");
				    	out.print("				<textarea cols='25%' rows='2' style='border:none; resize: none; overflow:hidden; font-family: 맑은 고딕;' readonly='readonly'>");
				    	out.print(rs.getString("contents"));
				    	out.print("				</textarea>");				
				    	out.print("			</td>"); 
				    	out.print("		</tr>");
				    	out.print("	</table>");
				    	out.print("</td>");
				    	if (ii  == img_cnt) {
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
					    	out.print("				<textarea cols='25%' rows='2' style='border:none; resize: none; overflow:hidden;' readonly='readonly'>");
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
		<ul>
		<%
		        for(int i=1; i<=count; i++) {
		%>
		        <li><a href='javascript:review_adoption(<%=i %>);'>[<%=i%>]</a></li>
		<%
		        };
		%>
		</ul>
	    </div>
</form>   
</body>
</html>