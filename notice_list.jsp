<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	a:link {text-decoration:none; color:black;}
	a:visited {text-decoration:none; color:black;}
	a:hover {text-decoration:none; color:black;}
	a:active {text-decoration:none; color:black;}

</style>
<title>공지사항</title>
</head>
<body>
		<h1>공지사항</h1>
		<h4>보듬보듬의 신규 및 업데이트 소식을 알려드립니다.</h4>
		<hr color="#0D3EA3">
		<table width="100%">
				<tr>
					<td width="6.67%" align="center"><b>번호</b></td>
					<td width="76.66%" align="center"><b>제목</b></td>
					<td width="10%" align="center"><b>작성일</b></td>
					<td width="6.67%" align="center"><b>조회수</b></td>
				</tr>
		</table>
		<hr color="#0D3EA3">
		<table width="100%">
				<tr>
					<td width="6.67%" align="center">8</td>
					<td width="76.66%"><a href="notice_read.jsp">제목입니다1</a></td>
					<td width="10%" align="center">2020-11-15</td>
					<td width="6.67%" align="center">48</td>
				</tr>
		</table>
		<hr color="#D5D5D5">
		<table width="100%">
				<tr>
					<td width="6.67%" align="center">7</td>
					<td width="76.66%"><a href="notice_read.jsp">제목입니다2</a></td>
					<td width="10%" align="center">2020-11-14</td>
					<td width="6.67%" align="center">32</td>
				</tr>
		</table>
		<hr color="#D5D5D5">
		<table width="100%">
				<tr>
					<td width="6.67%" align="center">6</td>
					<td width="76.66%"><a href="notice_read.jsp">제목입니다3</a></td>
					<td width="10%" align="center">2020-11-13</td>
					<td width="6.67%" align="center">60</td>
				</tr>
		</table>
		<hr color="#D5D5D5">
		<table width="100%">
				<tr>
					<td width="6.67%" align="center">5</td>
					<td width="76.66%"><a href="notice_read.jsp">제목입니다4</a></td>
					<td width="10%" align="center">2020-11-12</td>
					<td width="6.67%" align="center">28</td>
				</tr>
		</table>
		<hr color="#D5D5D5">
		<ul>
				<li>1</li>
				<li>2</li>
		</ul>
		<div><br>
		<form>		
        	<div>            
        		<ul>
                	<li><label for="searchColumn">검색</label></li>
                    <li>
                    	<select name="searchColumn" id="searchColumn" title="검색구분 선택">
                        	<option value="title">제목</option>
                            <option value="contents">내용</option>
                        </select>
                   	</li>
                    <li>
                    	<input type="text" name="keyword" id="keyword" class="w300" maxlength="50" title="검색어 입력"/>
                    </li>
                    <li>
                    	<input type="submit" value="조회">
                    </li>
				</ul>
       		</div>
		</form>
	</div>
</body>
</html>