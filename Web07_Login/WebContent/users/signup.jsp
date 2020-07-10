<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	
	UsersDao dao = UsersDao.getInstance();
	boolean isSuccess = dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(isSuccess){%>
		<p><strong><%=id %></strong> 회원님 가입되었습니다. <a href="loginform.jsp">확인</a></p>
	<% }else{%>
		<p>가입이 실패했습니다. <a href="signup_form.jsp">다시 가입</a></p>
	<% }%>
</body>
</html>