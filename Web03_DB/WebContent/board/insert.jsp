<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDto dto = new BoardDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	
	BoardDao dao = BoardDao.getInstance();
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
		<p>글이 추가되었습니다 </p>
		<a href="list.jsp">확인</a>
	<%}else{ %>
		<p>추가 실패했습니다.</p>
		<a href="list.jsp">확인</a>
	<%} %>
</body>
</html>