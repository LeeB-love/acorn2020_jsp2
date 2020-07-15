<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form.jsp</title>
</head>
<body>
<div class="container">
	<h1>파일 업로드 폼입니다.</h1>
	<%--
		[파일 업로드 폼 작성법]
		1. method="post"
		2. enctype="multipart/form-data" 속성추가
		3. <input type="file" />을 이용한다.
	 --%>
	<form action="upload.jsp" method="post" enctype="multipart/form-data"> <%--file 타입이 있는 경우엔 폼 전송방식이 좀 다르다. enctype을 추가해주어야함. --%>
		<%--그리고 lib 폴더에 commons파일 두 개 붙여넣기 --%>
		<label for="title">제목(설명)</label>
		<input type="text" name="title" id="title" /><br />
		<label for="myFile">첨부파일</label>
		<input type="file" name="myFile" id="myFile" />
		<button type="submit">업로드</button>
	</form>
</div>
</body>
</html>