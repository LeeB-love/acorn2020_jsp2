<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<h1>인덱스 페이지입니다.</h1>
	<ul>
		<li><a href="fortune">오늘의 운세</a></li>
		<li><a href="member">회원 한 명 보기</a></li>
		<li><a href="test/play.jsp">놀러가기</a></li>
	</ul>
	<form action="test/save.jsp" method="post">
		<input type="text" name="nick" placeholder="닉네임 입력..." />
		<button type="submit">닉네임 기억 시키기</button>
		<%--session에 담아두고 웹브라우저를 닫기 전까지 계속 기억시킬 수 있다. ex) 로그인 한 번 하면, 다른 페이지로 이동해도
			로그인이 계속 기억된다. 웹브라우저 끄기 전까진 계속 유지됨  --%>
	</form>
	<a href="test/delete.jsp">닉네임 삭제하기</a>
</body>
</html>