<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	UsersDto dto = UsersDao.getInstance().getData(id);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/updateform.jsp</title>
</head>
<body>
<div class="container">
	<h1>회원정보 수정 폼 입니다.</h1>
	<form action="update.jsp" method="post">
		<div class="form-group">
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" value="<%=id%>" disabled/>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" value="<%=dto.getEmail()%>"/>		
		</div>
		<button type="submit">수정</button>
		<button type="reset">취소</button>
	</form>
</div>
</body>
</html>