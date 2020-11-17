<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 function oneCheckbox(a){
  var obj=document.getElementsByName("sex");
  for (var i=0; i<obj.length; i++){
    if (obj[i]!=a){
    obj[i].checked=false;
    }else{ 
    	document.getElementById("sex1").value = obj[i].value; 
    }
  }
 }
 </script>
<style type="text/css">
th{border-bottom:2px solid #808080; background:white; text-align:left; font-size:18px; font-family:"나눔고딕"; color:balck;}
td{border-bottom:2px solid #808080; text-align:left; font-size:15px;font-family:"나눔고딕"; color:balck;}
#notice{
margin-left:150px; margin-top:40px; font-family:"나눔고딕"; font-size:30px;font-weight:bold
}
table{width:"400"; height:800px; margin:auto; text-align:center; border:1px soild #808080;
}
#button{float:right;border:2px solid #808080; background:#808080; font-family:"나눔고딕";}
#h1{font-family:"나눔고딕"; font-size:15px; margin-right:100px; float:right;}
</style>
</head>
<body>
<form action="Protecting_request.jsp" enctype="multipart/form-data" method="post">
<div id="notice">보호중 공고</div>
<hr width="100%" color=#808080>
<table>
<tr>
  <th>• 품종*</th>
  <td>
  <select name="variety" required>
  <option value="">선택</option>
        <option value="개">개</option>
        <option value="고양이">고양이</option>
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
   <th>• 나이</th>
     <td>
      <input type="text" name="old" value=""required></input>
     </td>
 </tr>
 <tr>
   <th>• 보호 장소*</th>
   <td>
     <select name="place" required>
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
      <input type="text" name="place1" placeholder="상세한 장소를 입력하세요." style="width:200px;"required></input>
   </td>
 </tr>
 
 <tr>
   <th>• 보호 시작 날짜*</th>
     <td>
       <input type="text" name="day" value="" placeholder=" ex)991231"required></input>
     </td>
 </tr>
 
 <tr>
 <th>• 특징*</th>
   <td>
      <input type="text" name="feature" value="" style="width:800px; height:150px;" required></input>
   </td>
 </tr>
<tr>
<th>• 문의전화*</th>
  <td>
      <input type="text" name="call" value="" style="width:200px;" placeholder=" '-'를 제외하고 기입해주세요. " required></input>
  </td>
</tr>
 <tr>
   <th>• 사진 업로드*</th>
   <td>
     <input type="file" name="image" id="imageFileOpenInput" accept="image/*" required>
   </td>
 </tr>
</table>
<button id="button" type="button" onclick="location.href='Protecting_board.jsp'"> 취소 </button>
<button id="button" type="submit" >등록</button>
</form>
</body>
</html>