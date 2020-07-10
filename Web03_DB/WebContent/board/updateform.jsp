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
			<li class="breadcrumb-item action">글 수정하기</li>
		</ol>	
		<br />
		
		<p class="font-weight-light text-primary" style="font-size:x-large;">
		<i class="fas fa-eraser"></i> 글 수정하기 </p>
		
		<form action="update.jsp" method="post">
			<div class="form-group">
				<input class="form-control" type="hidden" name="num" value="<%=dto.getNum() %>" />
				<lable for="num">번호</lable>
				<input class="form-control" type="text" id="num" value="<%=dto.getNum() %>" disabled/><br />
			</div>
			<div class="form-group">
				<lable for="writer">작성자</lable>
				<input class="form-control" type="text" name="writer" id="writer" value=<%= dto.getWriter()%>/><br />
			</div>
			<div class="form-group">
				<lable for="title">제목</lable>
				<input class="form-control" type="text" name="title" id="title" value=<%=dto.getTitle() %>/><br />	
			</div>
			<div class="form-group">
				<label for="content">내용</label><br />
				<textarea class="form-control" name="content" id="content" cols="30" rows="10"><%=dto.getContent() %></textarea><br />
			</div>
			<button class="btn btn-light" type="submit">수정하기</button>
			<button class="btn btn-light" type="reset">취소</button>
		</form>		
	</div>

</body>
</html>