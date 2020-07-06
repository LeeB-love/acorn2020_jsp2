<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>

	<div class="navbar navbar-expand-sm navbar-light bg-light">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">Acorn</a>

		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
		</ul>
	</div>

	<div class="container">
		<br />
		<br />
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
			<li class="breadcrumb-item"><a href="list.jsp">회원목록</a></li>
			<li class="breadcrumb-item active">회원정보 수정</li>
		</ol>
		<br />
		<h1>회원 정보 추가 폼입니다.</h1>
		<form action="${pageContext.request.contextPath }/member/insert.jsp" method="post">
			<div class="form-group">
				<label for="name">이름</label>
				<input class="form-control" type="text" name="name" id="name" /><br />
			</div>
			<div class="form-group">
				<label for="addr">주소</label>
				<input class="form-control" type="text" name="addr" id="addr" /><br />
			</div>
			<button class="btn btn-outline-primary btn-sm" type="submit">추가</button>
			<button class="btn btn-outline-warning btn-sm" type="reset">취소</button>
		</form>
	</div>
</body>
</html>