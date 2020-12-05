<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
form {
    /* Just to center the form on the page */
    margin: 0 auto;
    width: 600px;
    /* To see the outline of the form */
    padding: 1em;
    border: 1px none #CCC;
    border-radius: 1em;
}
</style>
<title>후기 작성</title>
</head>
<body>

	<% 
		String pageType = request.getParameter("type");
	%>
	
	<form id = "form2" action="review_popup_write_save.jsp" enctype="multipart/form-data" method="post">		
        <input type=hidden id="type"  name ="type"  value="<%=pageType%>">
    	<div>
        	<strong>
        	<label for="title">제목:</label>
        	<input type="text" id="title" name="title" maxlength="50"/>
        	</strong>
    	</div>
    	<p>
    	<div>
        	<label for="contents">내용:</label>
        	<textarea id="contents" name="contents" cols='80' rows='20' style='vertical-align:top; resize: none; font-family: 맑은 고딕;' ></textarea>
    	</div>
    	<p>
    	<div>
        	<label for="filename1">사진:</label>
        	<input type="file" id="filename1" name="filename1" />
    	</div>
    	<p>
		<div align="center">
				<input type="submit"  value="저장">
		</div>
	</form>	
</body>
</html>