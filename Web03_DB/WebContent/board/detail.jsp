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
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>

	<div class="navbar navbar-expand-sm navbar-light bg-light">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">Acorn</a>

		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
			<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/board/list.jsp">Board</a></li>
		</ul>
	</div>
	
	<div class="container">
		<br />
		<br />
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="list.jsp">할 일 목록</a></li>
			<li class="breadcrumb-item action">새로운 글 작성</li>
		</ol>	
		<br />
		<p class="font-weight-light text-primary" style="font-size:x-large;">
		<i class="fas fa-search-plus"></i> 새로운 글 작성 </p>
		<table class="table">
			<tr>
				<th scope="col">글번호</th>
				<td scope="row"><%=dto.getNum() %></td>
			</tr>
			<tr>
				<th scope="col">작성자</th>
				<td scope="row"><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th scope="col">제목</th>
				<td scope="row"><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<th scope="col">내용</th>
				<td scope="row"><textarea 
				style="background-color:rgb(245, 245, 245);"
				class="form-control" rows="20" cols="50" disabled><%=dto.getContent() %></textarea></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<a href="updateform.jsp?num=<%=dto.getNum() %>"><button class="btn btn-light">수정</button></a>
					<a href="javascript:deleteConfirm(<%=dto.getNum() %>)"><button class="btn btn-light">삭제</button></a>
				</td>
			</tr>
		</table>
	</div>
	
	
	<script>
		function deleteConfirm(num){
			var isDelete=confirm(num+" 번 글을 삭제 하시겠습니까?");
			if(isDelete){
				location.href="delete.jsp?num="+num;
			}
		}
	</script>
</body>
</html>