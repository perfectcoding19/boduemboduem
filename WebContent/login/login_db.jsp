<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.io.*"%>
<%
	request.setCharacterEncoding("UTF-8");
String ID = request.getParameter("id");
String pwd = request.getParameter("password");
%>
<jsp:useBean id="member" class="member.Member" scope="page" />
<jsp:setProperty name="member" property="id" />
<jsp:setProperty name="member" property="passwd" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%
	String id=null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}
	if(id!=null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.');");
		script.println("location.href='../main/home.jsp';");
		script.println("</script>");
	}
	
		MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.login(member.getId(), member.getPasswd());
	if (ID == "") {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디를 입력하세요.');");
		script.println("history.back();");
		script.println("</script>");
	} else if (pwd == "") {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호를 입력하세요.');");
		script.println("history.back();");
		script.println("</script>");
	} else if (result == 1) {
		session.setAttribute("id", member.getId());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href ='../main/home.jsp';");
		script.println("</script>");
	} else if (result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.');");
		script.println("history.back();");
		script.println("</script>");
	} else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.');");
		script.println("history.back();");
		script.println("</script>");
	} else if (result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
	}
	%>
</body>
</html>