<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<li class="breadcrumb-item action">새로운 글 작성</li>
		</ol>	
		<br />

		<p class="font-weight-light text-primary" style="font-size:x-large;">
		<i class="fas fa-plus"></i> 새로운 글 작성 </p>
		
		<form action="insert.jsp" method="post">
			<div class="form-group">
				<lable for="writer">작성자</lable>
				<input class="form-control" type="text" name="writer" id="writer" /><br />
			</div>
			<div class="form-group">
				<lable for="title">제목</lable>
				<input class="form-control" type="text" name="title" id="title" /><br />
			</div>
			<div class="form-group">
				<label for="content">내용</label><br />
				<textarea class="form-control" name="content" id="content" cols="30" rows="10"></textarea><br />
			</div>
			<button type="submit" class="btn btn-light">등록</button>
			<button type="reset" class="btn btn-light">취소</button>
		</form>
	</div>
</body>
</html>