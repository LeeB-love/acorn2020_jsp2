<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#btn{
		margin-left: 200px;
		margin-top: 200px;
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
	<div class="btn-group" role="group" aria-label="Basic example" id="btn">
		<button type="button" class="btn btn-primary">상</button>
		<button type="button" class="btn btn-success">중</button>
		<button type="button" class="btn btn-danger">하</button>
	</div>
</body>
</html>