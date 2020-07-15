<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	String pwd = request.getParameter("pwd");
	String newPwd = request.getParameter("newPwd");
	
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setNewpwd(newPwd);
	dto.setPwd(pwd);
	
	boolean isSuccess = UsersDao.getInstance().updatePwd(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(isSuccess){%>
		<p>비밀번호 변경이 완료되었습니다. <a href="info.jsp">확인</a></p>
	<% }else{%>
		<p>이전 비밀번호가 일치하지 않습니다. 다시 확인해주십시오. <a href="pwd_updateform.jsp">다시 시도</a></p>
	<% }%>
</body>
</html>