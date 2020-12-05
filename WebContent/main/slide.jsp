<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="slide_s.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<script type="text/javascript">
	function notice_read( no) {
			document.getElementById('no').setAttribute('value',no);
			document.getElementById('form1').submit();
		}    
</script>

<!-- 클래스명은 변경하면 안 됨 -->
<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide"><img src="http://oldmidi.cdn3.cafe24.com/p/0804.jpg"></div>
		<div class="swiper-slide"><img src="http://oldmidi.cdn3.cafe24.com/p/0243.jpg"></div>
		<div class="swiper-slide"><img src="http://oldmidi.cdn3.cafe24.com/p/0531.jpg"></div>
		<div class="swiper-slide"><img src="http://oldmidi.cdn3.cafe24.com/p/0263.jpg"></div>
		<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0727.jpg"></div>
		<div class="swiper-slide"><img src="https://ktsmemo.cafe24.com/p/0207.jpg"></div>
		<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0720.jpg"></div>
		<div class="swiper-slide"><img src="http://ktsmemo.cdn3.cafe24.com/p/0206.jpg"></div>
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>
<div  stlye="height:330px; width:5000px;">
	    <table width='50%'>
	    	<tr height='40'>
			    <td width='*'></td>
			    <td width='500px'>
					<br>
					<h3>공지사항</h3>
					<br>
		            <hr color="#AACE55">
			    </td>
			</tr>
	    </table>
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
				    while(rs.next()) {
				    	out.print("<table width='100%'>");
				    	out.print("  <tr height='40'>");
				    	out.print("    <td width='100%'><a href='javascript:notice_read("+rs.getString("no")+");'>"+rs.getString("title")+"</a></td>");
				    	out.print("  </tr>");
				    	out.print("</table>");
				    	out.print("<hr color='#D5D5D5'>");
				    }	
			    	out.print("     </td>");
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
</div>

<script>

new Swiper('.swiper-container', {

	slidesPerView : 2, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 2, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});

</script>
<form id = "form1" action="../notice/notice_read.jsp" method="post">		
	<input type=hidden id="no"  name ="no"  value="">
	<input type=hidden  name ="page"  value="1">
	<input type=hidden  name ="searchColumn"  value="title">
	<input type=hidden  name ="keyword"  value="">
</form>
</body>
</html>