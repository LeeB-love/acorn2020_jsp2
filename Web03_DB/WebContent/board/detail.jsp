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
<title>/board/detail.jsp</title>
</head>
<body>
	<h1>자세히 보기 페이지입니다.</h1>
	<table>
		<tr>
			<th>글번호</th>
			<td><%=dto.getNum() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="20" cols="50" disabled><%=dto.getContent() %></textarea></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<a href="updateform.jsp?num=<%=dto.getNum()%>">수정</a>
				<a href="javascript : deleteConfirm(<%=dto.getNum()%>)">삭제</a>
			</td>
		</tr>
	</table>
	
	<script>
		function deleteConfirm(num){
			var isDelete = confirm(num+" 번 글을 삭제하시겠습니까?");
			if(isDelete){
				location.href="delete.jsp?num=" + num;
			}
		}
	</script>
</body>
</html>