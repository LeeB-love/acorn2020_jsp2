<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
</head>
<body>
	<%
		//비즈니스 로직을 세운다.
		//1. 폼 전송되는 할 일을 읽어온다.
		request.setCharacterEncoding("utf-8");
		String work = request.getParameter("work");
		//2. DB에 저장한다.
		TodoDao dao = TodoDao.getInstance();
		boolean isupdate = dao.insert(work);
		//3. 클라이언트 웹브라우저에 응답한다.
	%>
	<p>
		<% if(isupdate){ %>
		할 일을 추가했습니다. <a href="list.jsp">확인 ㄱㄱ</a>
		<%}else{ %>
		글자수 초과로 추가하지 못했습니다.(최대 글자수 15자) <a href="list.jsp">돌아가기</a>
		<%} %>
	</p>
</body>
</html>