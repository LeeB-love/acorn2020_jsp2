<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.card{
		margin-left: 100px;
		margin-top: 200px;
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
<div class="container-sm">
	<div class="card w-75">
		<div class="card-body">
			<h5 class="card-title">카드 제목</h5>
			<p class="card-text">카드 내용입니다.</p>
			<a href="#" class="btn btn-warning">수정</a>
		</div>
	</div>
</div>
</body>
</html>