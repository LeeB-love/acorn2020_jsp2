<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDto dto = new BoardDto();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuccess = BoardDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(isSuccess){%>
		<script>
			alert("수정되었습니다.")
			location.href="detail.jsp?num=<%=dto.getNum()%>"
		</script>
	<% }else{%>
		<script>
			alert("수정 실패했습니다.")
			location.href="updateform.jsp?num=<%=dto.getNum()%>"
		</script>
	<% }%>
</body>
</html>