<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="java.io.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="member.Member" scope="page" />
<jsp:setProperty name="member" property="name"/>
<jsp:setProperty name="member" property="id"/>
<jsp:setProperty name="member" property="passwd"/>
<jsp:setProperty name="member" property="email"/>
<jsp:setProperty name="member" property="c_number"/>
<jsp:setProperty name="member" property="address"/>
<jsp:setProperty name="member" property="birth"/>
<jsp:setProperty name="member" property="gender"/>
<jsp:setProperty name="member" property="info_receive"/>
<jsp:setProperty name="member" property="email_id"/>
<jsp:setProperty name="member" property="email_host"/>
<jsp:setProperty name="member" property="fst_num"/>
<jsp:setProperty name="member" property="scd_num"/>
<jsp:setProperty name="member" property="trd_num"/>
<jsp:setProperty name="member" property="year"/>
<jsp:setProperty name="member" property="month"/>
<jsp:setProperty name="member" property="day"/>
<jsp:setProperty name="member" property="y_n"/>
<jsp:setProperty name="member" property="y_n2"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보듬보듬</title>
</head>
<body>
	<%
		MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.join(member);
	PrintWriter script = response.getWriter();
	if (result == -1) {
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.');");
		script.println("history.back();");
		script.println("</script>");
	} else {
		session.setAttribute("id", member.getId());
		script.println("<script>");
		script.println("location.href ='../main/home.jsp';");
		script.println("</script>");
	}
	%>
</body>
</html>