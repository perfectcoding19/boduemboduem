<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../main/header_s.css">
<script type="text/javascript">
 function oneCheckbox(a){
  var obj=document.getElementsByName("sex");
  for (var i=0; i<obj.length; i++){
    if (obj[i]!=a){
    obj[i].checked=false;
    }else{
    	document.getElementById("sex1").value = obj[i].value;}
  }
 }
 
 function categoryChange(e){
  var good_개 = ["선택", "기타", "골든 리트리버", "그레이 하운드", "그레이트 덴", "닥스훈트", "달마시안", "도베르만", "말라뮤트", "말티즈", "푸들", "스탠다들 푸들", "토이 푸들", "믹스견", "보더콜리", 
  "불독", "비글", "비숑 프리제", "사모예드", "삽살개", "슈나우저", "스피츠", "시바", "시베리안 허스키", "시츄", "요크셔 테리어", "웰시코기", "치와와", "포메라니안"];
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
  var good_경기도 = ["가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시",
  "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "용인시 기흥구", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"];
  var good_강원도 = ["강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백군", "평창군", "홍천군", "횡성군"];
  var good_충청북도 = ["괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군", "진천군", "청주시", "충주시"];
  var good_충청남도 = ["계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군", "아산시", "연기군", "예산군", "천안시", "청양군", "태안군", "홍성군"];
  var good_전라북도 = ["고창군", "군산군", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시", "진안군"];
  var good_전라남도 = ["강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시",
  "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
  var good_경상북도 = ["경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시",
  "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시"];
  var good_경상남도 = ["거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "창녕군", "창원 마산합포회원구", "창원 의창성산구", "창원 진해구", "통영시", 
  "하동군", "함안군", "함양군", "합천군"];
  var good_제주도 = ["서귀포시", "제주시", "제주특별자치도"];
  
  var target; 
  

  if(e.name == 'variety'){
	  target = document.getElementById("good");
  }else{
	  target = document.getElementById("place2"); 
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
 } <!--
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
 <!--
function call_mask(objValue) {
  var v = objValue.replace("--", "-");

     if (v.match(/^\d{3}$/) !== null) {
         v = v + '-';
     } else if (v.match(/^\d{3}\-\d{4}$/) !== null) {
         v = v + '-';
     }
   
     return v;
 }
 //-->
 </script>
<style type="text/css">
th{border-bottom:2px solid #c7d696; background:white; text-align:left; font-size:18px; font-family:"맑은 고딕"; color:balck;}
td{border-bottom:2px solid #c7d696; text-align:left; font-size:15px;font-family:"맑은 고딕"; color:balck;}
#notice{
margin-left:150px; margin-top:40px; font-family:"맑은 고딕"; font-size:30px;font-weight:bold
}
table{width:"400"; height:800px; margin:auto; text-align:center; border:1px soild #c7d696;
}
#button{float:right;border:2px solid #c7d696; text-align:center; background:#c7d696; font-family:"맑은 고딕";}
#h1{font-family:"맑은 고딕"; font-size:15px; margin-right:100px; float:right;}
</style>
</head>
<body>
<%
		String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
	%>
	<div class="hd">
		<h1>
			<a href="home.jsp">보듬보듬</a>
		</h1>

		<%
			if (id == null) {
		%>
		<div class="joinup">
			<ul>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
		</div>
		<%
			} else {
		%>
		<div class="joinup">
			<ul>
				<li><a href="logout_db.jsp">로그아웃</a></li>
				<li><a href="mypage.jsp">마이페이지</a></li>
			</ul>
		</div>
		<%
			}
		%>

		<nav class="menu">
			<ul>
				<li><a href="../main/introduce.jsp">소개</a></li>
				<li class="dropdown"><a class="dropbtn" href="">유기동물 공고</a>
					<div class="dropdown-content">
						<a href="../Totalnotice/Totalnotice_board.jsp">전체 공고</a> <a href="../Protecting/Protecting_board.jsp">보호중 공고</a>
					</div></li>
				<li><a href="../Lossreport/Lossreport_board.jsp">분실신고</a></li>
				<li class="dropdown"><a class="dropbtn" href="adopt_info.jsp">입양/습득시
						안내</a>
					<div class="dropdown-content">
						<a href="adopt_info.jsp">입양안내</a> <a href="got_info.jsp">습득시
							안내</a>
					</div></li>
				<li class="dropdown"><a class="dropbtn"
					href="review_adoption.jsp">봉사활동/입양후기</a>
					<div class="dropdown-content">
						<a href="">봉사활동</a> <a href="review_adoption.jsp">입양후기</a>
					</div></li>
				<li><a href="notice_list.jsp">공지사항</a></li>
			</ul>
		</nav>
	</div>
<form action="Protecting_request.jsp" enctype="multipart/form-data" method="post">
<div id="notice">보호 중</div>
<hr width="100%" color=#c7d696>
<table>
<tr>
  <th>• 품종</th>
  <td>
  <select name="variety" onchange="categoryChange(this)">
  <option value="">선택</option>
        <option name="개" value="개">개</option>
        <option name="고양이" value="고양이">고양이</option>
        <option name="기타" value="기타">기타</option>
  </select>
  <select id="good" name="variety1">
  <option>선택</option>
  </select>
  </td>
 </tr>
 <tr>
 <th>• 성별</th>
 <td>
 <div>
 <input type="hidden" name="sex1" id="sex1" value="">
 <input type="checkbox" name="sex" value="수컷" onclick="oneCheckbox(this)">수컷
 <input type="checkbox" name="sex" value="암컷" onclick="oneCheckbox(this)">암컷
 </div>
 </td>
 </tr>
 <tr>
   <th>• 추정 나이</th>
     <td>
      <input type="text" name="old" value=""></input>
     </td>
 </tr>
 <tr>
   <th>• 발견 장소</th>
   <td>
     <select name="place" onchange="categoryChange(this)">
        <option value="">전체</option>
        <option value="서울특별시">서울시</option>
        <option value="인천광역시">인천시</option>
        <option value="대구광역시">대구시</option>
        <option value="대전광역시">대전시</option>
        <option value="광주광역시">광주시</option>
        <option value="부산광역시">부산시</option>
        <option value="울산광역시">울산시</option>
        <option value="세종특별시">세종시</option>
        <option value="경기도">경기도</option>
        <option value="강원도">강원도</option>
        <option value="충청북도">충청북도</option>
        <option value="충청남도">충청남도</option>
        <option value="전라북도">전라북도</option>
        <option value="전라남도">전라남도</option>
        <option value="경상북도">경상북도</option>
        <option value="경상남도">경상남도</option>
        <option value="제주도">제주도</option>
  </select>
  <select id="place2" name="place2">
  <option>선택</option>
  </select>
      <input type="text" name="place1" placeholder="상세한 장소를 입력하세요." style="width:200px;" ></input>
   </td>
 </tr>
 
 <tr>
   <th>• 보호 시작 날짜</th>
     <td>
       <input type="text" name="day" value="" placeholder=" ex)1999-12-31" onkeyup="this.value = date_mask(this.value)"></input>
     </td>
 </tr>
 <tr>
 <th>• 특징</th>
   <td>
      <input type="text" name="feature" value="" style="width:800px; height:150px;" ></input>
   </td>
 </tr>
<tr>
<th>• 문의전화</th>
  <td>
      <input type="text" name="call" value="" style="width:200px;" onkeyup="this.value = call_mask(this.value)" ></input>
  </td>
</tr>
 <tr>
   <th>• 사진 업로드</th>
   <td>
     <input type="file" name="image" id="imageFileOpenInput" accept="image/*" >
   </td>
 </tr>
</table>
<button id="button" type="button" onclick="location.href='Protecting_board.jsp'"> 취소 </button>
<button id="button" type="submit">등록</button>
</form>
<br>
<br>
<br>
<div class="footer">
		<jsp:include page="../main/footer.jsp" flush="false" />
	</div>
</body>
</html>