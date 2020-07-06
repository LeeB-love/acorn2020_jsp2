<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>새 글 작성 폼입니다.</h1>
	<form action="insert.jsp" method="post">
		<lable for="writer">작성자</lable>
		<input type="text" name="writer" id="writer" /><br />
		<lable for="title">제목</lable>
		<input type="text" name="title" id="title" /><br />
		<label for="content">내용</label><br />
		<textarea name="content" id="content" cols="30" rows="10"></textarea><br />
		<input type="submit" value="등록" />
		<input type="reset" value="취소" />
	</form>
</body>
</html>