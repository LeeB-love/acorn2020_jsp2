<%@page import="test.dto.QnaDto"%>
<%@page import="test.dao.QnaDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	QnaDao dao = QnaDao.getInstance();
	List<QnaDto> list = dao.getlist();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>QNA</h1>
	<h3>문의사항이 있다면 남겨주세요</h3>
	<table>
		<thead>
			<tr>
				<th>순번</th>
				<th>이름</th>
				<th>내용</th>
				<th>작성일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<% for(QnaDto tmp : list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getContents() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td><a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
			</tr>
			<%} %>
		</tbody>
	</table>
	<a href="${pageContext.request.contextPath }/qna/insertform.jsp">
		<button>문의하기</button>
	</a>
</body>
</html>