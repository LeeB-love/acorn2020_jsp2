<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	//수정할 이메일 주소
	String email = request.getParameter("email");
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setEmail(email);
	boolean isSuccess = UsersDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update.jsp</title>
</head>
<body>
	<script>
		alert("수정 완료했습니다.");
		location.href="${pageContext.request.contextPath }/users/private/info.jsp"
	</script>
</body>
</html>