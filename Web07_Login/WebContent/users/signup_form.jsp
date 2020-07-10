<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
	<h1>회원가입 폼입니다.</h1>
	<form action="signup.jsp">
		<div class="form-group">
			<lable  for="id">아이디</lable>
			<input class="form-control" type="text" name="id" id="id" />
		</div>
		<div class="form-group">
			<lable for="pwd">비밀번호</lable>
			<input class="form-control" type="text" name="pwd" id="pwd" />
		</div>
		<div class="form-group">
			<lable for="email">이메일</lable>
			<input class="form-control" type="text" name="email" id="email" />
		</div>
		<button type="submit">가입</button>
		<button type="reset">취소</button>
	</form>
</body>
</html>