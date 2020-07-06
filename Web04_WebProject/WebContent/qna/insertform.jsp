<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insert.jsp" method="post">
		<label for="name">이름</label>
		<input type="text" name="name" id="name"/><br />
		<label for="contents">문의사항</label>
		<input type="text" name="contents" id="contents"/>
		<button type="submit">확인</button>
	</form>
	
</body>
</html>