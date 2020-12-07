<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../main/slide_s.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var _width = 800;
var _height = 800;
var _left = Math.ceil((screen.width - _width) / 2);
var _top = Math.ceil((screen.height - _height) / 2);

function popup_open(no) {
	window.open("../Totalnotice/Totalnotice_popup.jsp?no=" + no, "new", "width=" + _width
			+ ",height=" + _height + ",top=" + _top + ",left=" + _left
			+ ", scrollbars=yes");
}
</script>
</head>
<body>

	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
	<%
		Connection conn = null;
	PreparedStatement pstmt = null;
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/boduemdb?useSSL=false";
	String user = "root";
	String pw = "seoyeon001";
	int total = 0;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	String startDay = "";
	String endDay = "";
	String variety = "";
	String variety1 = "";
	String place = "";
	String place1 = "";
	startDay = request.getParameter("day1") == null ? "" : request.getParameter("day1");
	endDay = request.getParameter("day2") == null ? "" : request.getParameter("day2");
	variety = request.getParameter("variety") == null ? "" : request.getParameter("variety");
	variety1 = request.getParameter("variety1") == null ? "" : request.getParameter("variety1");
	place = request.getParameter("place") == null ? "" : request.getParameter("place");
	place1 = request.getParameter("place1") == null ? "" : request.getParameter("place1");
	String where = "";
	if (!"".equals(startDay)) {
		where += " AND day BETWEEN '" + startDay + "'" + " AND '" + endDay + "' ";
	}
	if (!"".equals(variety)) {
		where += " AND variety='" + variety + "'";

	}
	if (!"".equals(variety1)) {
		where += " AND variety1='" + variety1 + "'";
	}
	if (!"".equals(place)) {
		where += " AND place='" + place + "'";

	}
	if (!"".equals(place1)) {
		where += " AND place1='" + place1 + "'";
	}
	try {
		conn = DriverManager.getConnection(url, user, pw);

		String sql2 = "select COUNT(*) from Totalnotice where 1=1 " + where;
		pstmt = conn.prepareStatement(sql2);
		rs3 = pstmt.executeQuery();
		if (rs3.next()) {
			total = rs3.getInt(1);
		}
		boolean prev;
		boolean next;
		int displayPage = 10;
		int displayRow = 10;
		int pageCnt = 1;
		try {
			pageCnt = Integer.parseInt((String) request.getParameter("pageCnt"));
		} catch (Exception e) {
			pageCnt = 1;
		}
		int endPage = ((int) Math.ceil(pageCnt / (double) displayPage)) * displayPage;
		int beginPage = endPage - (displayPage - 1);
		int totalPage = (int) Math.ceil(total / (double) displayRow);

		if (totalPage < endPage) {
			endPage = totalPage;
			next = false;
		} else {
			next = true;
		}
		prev = (beginPage == 1) ? false : true;

		int term = displayRow;
		int pageNum = (pageCnt - 1) * term;

		String sql = String.format("select * from Totalnotice WHERE 1=1 %s order by idx desc limit %d,%d;", where, pageNum,
		term);
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		rs2 = pstmt.executeQuery();
	%>


	<!-- 클래스명은 변경하면 안 됨 -->
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<%
				while (rs2.next()) {
			%>
			<div class="swiper-slide">
				<button
					style="margin-left: 4px; margin-right: 4px; border: none; width: 250px; height: 250px; cursor: pointer;"
					onclick="popup_open(<%=rs2.getString("idx")%>)">
					<img alt="" src="../image/<%=rs2.getString("filename")%>"
						style="width: 250px; height: 250px" />
				</button>
				<div class="expl">
					<div>
						• 품종 :
						<%=rs2.getString("variety")%>
						-
						<%=rs2.getString("variety1")%></div><br>
					<div>
						• 나이 :
						<%=rs2.getString("old")%></div><br>
					<div>
						• 성별 :
						<%=rs2.getString("sex")%></div><br>
					<div>
						• 지역 :
						<%=rs2.getString("place")%>
						<%=rs2.getString("place1")%>
					</div><br>
					<div>
						• 날짜 :
						<%=rs2.getString("day")%></div>
				</div>
			</div>
			<%
				}
			%>
		</div>

		<!-- 네비게이션 -->
		<div class="swiper-button-next"></div>
		<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
		<div class="swiper-button-prev"></div>
		<!-- 이전 버튼 -->

		<!-- 페이징 -->
		<div class="swiper-pagination"></div>
	</div>
	<%
		} catch (SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
	} finally {
	if (rs2 != null)
		try {
			rs2.close();
		} catch (SQLException ex) {
		}
	if (pstmt != null)
		try {
			pstmt.close();
		} catch (SQLException ex) {
		}
	if (conn != null)
		try {
			conn.close();
		} catch (SQLException ex) {
		}
	}
	%>

	<script>

new Swiper('.swiper-container', {

	slidesPerView : 2, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 5, // 슬라이드간 간격
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
</body>
</html>