<%@page import="test.board.dao.BoardDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<BoardDto> list = new ArrayList<>();
	BoardDao dao = BoardDao.getInstance();
	list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/list.jsp</title>
</head>
<body>
	<h1>글 목록 입니다.</h1>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<%for(BoardDto tmp : list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><a href="detail.jsp?num=<%=tmp.getNum() %>"><%=tmp.getTitle() %></a></td>
					<td><%=tmp.getRegdate() %></td>
				</tr>
			<% }%>
		</tbody>
	</table>
	<a href="insertform.jsp">글 추가하기</a>
</body>
</html>