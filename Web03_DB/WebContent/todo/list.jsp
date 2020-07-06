<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>

	<div class="navbar navbar-expand-sm navbar-light bg-light">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">Acorn</a>

		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
			<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
		</ul>
	</div>

<%
	TodoDao dao = TodoDao.getInstance();
	List<TodoDto> list = dao.getList();
%>
	<div class="container">
		<br />
		<p class="font-weight-light text-primary" style="font-size: xx-large;">
		<i class="fas fa-clipboard-list"></i> 할 일 목록 </p>
		<table class="table">
			<thead class="thead-light">
				<tr style="text-align: center;">
					<th scope="col" width="70">#</th>
					<th scope="col">해야할 일</th>
					<th scope="col" width="150">작성일</th>
					<th scope="col" width="100">삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(TodoDto tmp : list){ %>
					<tr style="text-align: center;">
						<td scope="row"><%= tmp.getNum() %></td>
						<td><%= tmp.getWork() %></td>
						<td><%= tmp.getRegdate() %></td>
						<td>
							<a href="delete.jsp?num=<%=tmp.getNum() %>"><i class="fas fa-minus-circle"></i></a>
							<!-- ?num= 숫자 => 숫자 파라미터 부여하기 -->
 						</td>
					</tr>
				<% }%>
			</tbody>
		</table>
		
		<div class="container" align="right">
			<div class="form-group">
				<form action="${pageContext.request.contextPath }/todo/insert.jsp" method="post">
					<div>
						<input type="text" name="work" id="work" class="form-control" style="margin-bottom: 5px;"/>
						<button type="submit" class="btn btn-light">할 일 추가하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>