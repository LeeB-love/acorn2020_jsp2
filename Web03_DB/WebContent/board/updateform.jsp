<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDao dao = BoardDao.getInstance();
	BoardDto dto = dao.getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글 수정 폼입니다.</h1>
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum() %>" />
		<lable for="num">번호</lable>
		<input type="text" id="num" value="<%=dto.getNum() %>" disabled/><br />
		<lable for="writer">작성자</lable>
		<input type="text" name="writer" id="writer" value=<%= dto.getWriter()%>/><br />
		<lable for="title">제목</lable>
		<input type="text" name="title" id="title" value=<%=dto.getTitle() %>/><br />
		<label for="content">내용</label><br />
		<textarea name="content" id="content" cols="30" rows="10"><%=dto.getContent() %></textarea><br />
		<input type="submit" value="수정하기" />
		<input type="reset" value="취소" />
	</form>
</body>
</html>