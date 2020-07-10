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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>

	<div class="navbar navbar-expand-sm navbar-light bg-light">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">Acorn</a>

		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/board/list.jsp">Board</a></li>
		</ul>
	</div>

	<div class=container>
		<br />
		<br />
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
			<li class="breadcrumb-item">글목록</li>
		</ol>	
		<br />
		<p class="font-weight-light text-primary" style="font-size: xx-large;">
		<i class="fas fa-pencil-alt"></i> 글 목록 </p>
		<table class="table">
			<thead class="thead-light">
				<tr style="text-align: center;">
					<th scope="col" width="70">#</th>
					<th scope="col">작성자</th>
					<th scope="col">제목</th>
					<th scope="col" width="220">작성일</th>
				</tr>
			</thead>
			<tbody>
				<%for(BoardDto tmp : list){ %>
					<tr style="text-align: center;">
						<td scope="row"><%=tmp.getNum() %></td>
						<td><%=tmp.getWriter() %></td>
						<td><a href="detail.jsp?num=<%=tmp.getNum() %>"><%=tmp.getTitle() %></a></td>
						<td><%=tmp.getRegdate() %></td>
					</tr>
				<% }%>
			</tbody>
		</table>
		<a href="insertform.jsp"><button class="btn btn-light">글 추가하기</button></a>
		</div>
</body>
</html>