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
<div class="container-sm">
	<div class="form-row">
    <div class="col-md-6 mb-3">
      <label for="validationServer03">email</label>
      <input type="text" class="form-control is-invalid" id="validationServer03" required>
      <div class="invalid-feedback">
      	형식이 달라요
      </div>
    </div>
</div>
</body>
</html>