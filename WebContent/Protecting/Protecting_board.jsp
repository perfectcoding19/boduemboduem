<%@page import="java.util.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../Totalnotice/board_s.css">
<title>보호중 동물</title>
<script type="text/javascript">
 function categoryChange(e){
  var good_개 = ["선택", "기타", "골든 리트리버", "그레이 하운드", "그레이트 덴", "닥스훈트", "달마시안", "도베르만", "말라뮤트", "말티즈", "푸들", "스탠다들 푸들", "토이 푸들", "믹스견", "보더콜리", 
  "불독", "비글", "비숑 프리제", "사모예드", "삽살개", "슈나우저", "스피츠", "시바", "시베리안 허스키", "시츄", "요크셔 테리어", "웰시코기", "치와와", "포인터", "포메라니안"];
  var good_고양이 = ["선택", "노르웨이 숲", "데본 렉스", "버말", "러시안 블루", "먼치킨", "믹스묘", "벵갈", "봄베이", "발리네즈", "사바나 캣", "샴", "스핑크스", "아메리칸 쇼트헤어", "페르시안", "한국고양이"];
  var good_기타 = ["선택", "기타 축종"];
  var good_서울특별시 = ["전체", "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구",
  "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
  var good_인천광역시 = ["전체", "강화군", "계양구", "남동구", "동구", "미추홀구", "부평구", "서구", "연수구", "옹진군", "중구"];
  var good_대구광역시 = ["전체", "남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구"];
  var good_대전광역시 = ["전체", "대덕구", "동구", "서구", "유성구", "중구"];
  var good_광주광역시 = ["전체", "광산구", "남구", "동구", "북구", "서구"];
  var good_부산광역시 = ["전체", "강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구"];
  var good_울산광역시 = ["전체", "남구", "동구", "북구", "울주군", "중구"];
  var good_세종특별시 = ["전체"];
  var good_경기도 = ["전체", "가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시",
  "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "용인시 기흥구", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"];
  var good_강원도 = ["전체", "강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백군", "평창군", "홍천군", "횡성군"];
  var good_충청북도 = ["전체", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군", "진천군", "청주시", "충주시"];
  var good_충청남도 = ["전체", "계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군", "아산시", "연기군", "예산군", "천안시", "청양군", "태안군", "홍성군"];
  var good_전라북도 = ["전체", "고창군", "군산군", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시", "진안군"];
  var good_전라남도 = ["전체", "강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시",
  "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
  var good_경상북도 = ["전체", "경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시",
  "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시"];
  var good_경상남도 = ["전체", "거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "창녕군", "창원 마산합포회원구", "창원 의창성산구", "창원 진해구", "통영시", 
  "하동군", "함안군", "함양군", "합천군"];
  var good_제주도 = ["전체", "서귀포시", "제주시", "제주특별자치도"];
  
  var target; 
  
  if(e.name == 'variety'){
	  target = document.getElementById("good");
  }else{
	  target = document.getElementById("place1"); 
  }
 
  
  if (e.value=="개") var d= good_개;
  else if(e.value=="고양이") var d= good_고양이;
  else if(e.value=="기타") var d=good_기타;
  else if(e.value=="서울특별시") var d=good_서울특별시;
  else if(e.value=="인천광역시") var d=good_인천광역시;
  else if(e.value=="대구광역시") var d=good_대구광역시;
  else if(e.value=="대전광역시") var d=good_대전광역시;
  else if(e.value=="광주광역시") var d=good_광주광역시;
  else if(e.value=="부산광역시") var d=good_부산광역시;
  else if(e.value=="울산광역시") var d=good_울산광역시;
  else if(e.value=="세종특별시") var d=good_세종특별시;
  else if(e.value=="경기도") var d=good_경기도;
  else if(e.value=="강원도") var d=good_강원도;
  else if(e.value=="충청북도") var d=good_충청북도;
  else if(e.value=="충청남도") var d=good_충청남도;
  else if(e.value=="전라북도") var d=good_전라북도;
  else if(e.value=="전라남도") var d=good_전라남도;
  else if(e.value=="경상북도") var d=good_경상북도;
  else if(e.value=="경상남도") var d=good_경상남도;
  else if(e.value=="제주도") var d=good_제주도;
  
   target.options.length=0;
  for (x in d){
   var opt=document.createElement("option");
   opt.value=d[x];
   opt.innerHTML=d[x];
   target.appendChild(opt);
   }
 }  
  <!--
function date_mask(objValue) {
  var v = objValue.replace("--", "-");
     if (v.match(/^\d{4}$/) !== null) {
         v = v + '-';
     } else if (v.match(/^\d{4}\-\d{2}$/) !== null) {
         v = v + '-';
     }
   
     return v;
 }
 //-->
 var _width = 800;
    var _height = 800;
    var _left = Math.ceil((screen.width - _width ) / 2);
    var _top = Math.ceil((screen.height - _height ) / 2);
    
    function popup_open(no) {
    	window.open(
    	"Protecting_popup.jsp?no="+no,
    	"new",
    	"width="+_width+",height="+_height+",top="+_top+",left="+_left+", scrollbars=yes");
    }
    
 </script>
</head>
<body>
	<div class="header">
		<jsp:include page="../main/header.jsp" flush="false" />
	</div>
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

		String sql2 = "select COUNT(*) from protecting where 1=1 " + where;
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

		String sql = String.format("select * from protecting WHERE 1=1 %s order by idx desc limit %d,%d;", where, pageNum,
		term);
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		rs2 = pstmt.executeQuery();
	%>
	<script>
	function fncSubmit() {
		var form = document.search;
		if(form.day1.value != null && form.day1.value != "") {
			if(form.day2.value == null || form.day2.value == "") {
				alert("검색하실 마지막 날짜도 작성 하셔야 됩니다.");
				return false;
			}
		}
		
		form.action ="Protecting_board.jsp";
		form.submit();
	}
</script>
	<div class="section">
		<div id="notice">
			보호중 동물
			<hr style="margin-top:15px;" width="100%" color=#c7d696 size="2">
			<br>
		</div>
		<form name="search" action="javascript:fncSubmit()" method="get">
			<table>
				<tr>
					<th>• 보호 시작 날짜</th>
					<td><input type="text" name="day1" value="<%=startDay%>"
						placeholder="ex) 1999-01-01"
						onkeyup="this.value = date_mask(this.value)"></input> ~ <input
						type="text" name="day2" value="<%=endDay%>"
						placeholder="ex) 1999-12-31"
						onkeyup="this.value = date_mask(this.value)"></input> (검색 시작 날짜와 끝
						날짜를 모두 입력하세요.)</td>
				</tr>
				<tr>
					<th>• 품종</th>
					<td><select name="variety" onchange="categoryChange(this)">
							<option value="">선택</option>
							<option <%if (variety.equals("개")) {%> selected <%}%> name="개"
								value="개">개</option>
							<option <%if (variety.equals("고양이")) {%> selected <%}%>
								name="고양이" value="고양이">고양이</option>
							<option <%if (variety.equals("기타")) {%> selected <%}%> name="기타"
								value="기타">기타</option>
					</select> <select id="good" name="variety1">
							<option value="">선택</option>
					</select></td>
				</tr>
				<tr>
					<th>• 발견 장소</th>
					<td><select name="place" onchange="categoryChange(this)">
							<option value="">전체</option>
							<option <%if (place.equals("서울특별시")) {%> selected <%}%>
								value="서울특별시">서울시</option>
							<option <%if (place.equals("인천광역시")) {%> selected <%}%>
								value="인천광역시">인천시</option>
							<option <%if (place.equals("대구광역시")) {%> selected <%}%>
								value="대구광역시">대구시</option>
							<option <%if (place.equals("대전광역시")) {%> selected <%}%>
								value="대전광역시">대전시</option>
							<option <%if (place.equals("광주광역시")) {%> selected <%}%>
								value="광주광역시">광주시</option>
							<option <%if (place.equals("부산광역시")) {%> selected <%}%>
								value="부산광역시">부산시</option>
							<option <%if (place.equals("울산광역시")) {%> selected <%}%>
								value="울산광역시">울산시</option>
							<option <%if (place.equals("세종특별시")) {%> selected <%}%>
								value="세종특별시">세종시</option>
							<option <%if (place.equals("경기도")) {%> selected <%}%> value="경기도">경기도</option>
							<option <%if (place.equals("강원도")) {%> selected <%}%> value="강원도">강원도</option>
							<option <%if (place.equals("충청북도")) {%> selected <%}%>
								value="충청북도">충청북도</option>
							<option <%if (place.equals("충청남도")) {%> selected <%}%>
								value="충청남도">충청남도</option>
							<option <%if (place.equals("전라북도")) {%> selected <%}%>
								value="전라북도">전라북도</option>
							<option <%if (place.equals("전라남도")) {%> selected <%}%>
								value="전라남도">전라남도</option>
							<option <%if (place.equals("경상북도")) {%> selected <%}%>
								value="경상북도">경상북도</option>
							<option <%if (place.equals("경상남도")) {%> selected <%}%>
								value="경상남도">경상남도</option>
							<option <%if (place.equals("제주도")) {%> selected <%}%> value="제주도">제주도</option>
					</select> <select id="place1" name="place1">
							<option value="">선택</option>
					</select> <input type=submit value="조회" id="button"></td>
				</tr>
			</table>
		</form>
		<div class="main">
			<div>
				<%
					while (rs2.next()) {
				%>
				<div class="sub">
					<button
						style="margin-left:4px; border: none; width: 40%; height: 80%; float: left;"
						onclick="popup_open(<%=rs2.getString("idx")%>)">
						<img alt="" src="../image/<%=rs2.getString("filename")%>"
							style="width: 100%; height: 100%" />
					</button>
					<div style="height: 15%;margin-top:6px;">
						&nbsp;• 품종 :
						<%=rs2.getString("variety")%>
						-
						<%=rs2.getString("variety1")%></div>
					<div style="height: 15%">
						&nbsp;• 추정 나이 :
						<%=rs2.getString("old")%></div>
					<div style="height: 15%">
						&nbsp;• 성별 :
						<%=rs2.getString("sex")%></div>
					<div style="height: 15%">
						&nbsp;• 발견 장소 :
						<%=rs2.getString("place")%>
						<%=rs2.getString("place1")%>
						<%=rs2.getString("place2")%>
					</div>
					<div style="height: 15%">
						&nbsp;• 보호 시작 날짜:
						<%=rs2.getString("day")%></div>
				</div>
				<%
					}
				%>
			</div>
			<hr width="100%" color=#c7d696 size="2">
			<%
				//if(prev){
			%>
			<%-- 	 <a href="Protecting_board.jsp?pageCnt=<%=pageCnt-1 %>">prev</a>  --%>
			<div style="display: inline-block; margin-left: 50%">
				<%
					//}
				for (int i = beginPage; i <= endPage; i++) {
				%>
				<a style="color:black;" href="Protecting_board.jsp?pageCnt=<%=i%>"><%=i%></a>
				<%
					}
				%>
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
			<%
				String id = null;
			if (session.getAttribute("id") != null) {
				id = (String) session.getAttribute("id");
			}
			if (id == null) {
			%>

			<%
				} else {
			%>
			<button id="button" onclick="location.href='../Protecting/Protecting_write.jsp'"
				style="margin-top: 40px;">글쓰기</button>
			<%
				}
			%>
		</div>
	</div>
	<div class="footer">
		<jsp:include page="../main/footer.jsp" flush="false" />
	</div>
</body>
</html>