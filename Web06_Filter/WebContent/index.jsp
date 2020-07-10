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
	<form action="test/insert.jsp" method="post">
	<%
		//로그인된 아이디 읽어오기
		String id = (String)session.getAttribute("id");
	%>
		<input type="text" name="msg" placeholder="서버에 할 말 입력.." />
		<button type="submit">전송</button>
	</form>
	<h2>가상의 로그인 폼</h2>
	<% if(id==null){%>
		<form action="test/login.jsp" method="post">
			<input type="text" name="id" placeholder="아이디..." />
			<input type="password" name="pwd" placeholder="비밀번호..."/>
			<button type="submit">로그인</button> 
		</form>
	<%}else{ %>
		<p><strong><%=id %>님 로그인 중...</strong><a href="test/logout.jsp">로그아웃</a></p>
	<%} %>
	<ul>
		<li><a href="member/play.jsp">회원 전용 공간으로 가기</a></li>
		<li><a href="member/study.jsp">회원 전용 공간으로 가기2</a></li>
		<li><a href="member/buy.jsp?num=1&amount=10">구입하기</a></li>
	</ul>
	
</body>
</html>
<%--
	보내는게 주 목적이면 post, 갖고오는게 주 목적이면 get
	post 방식에선 input name으로, get 방식에선 ?num= xx 와 같은 방식으로 파라미터 부여
	post 방식으로 전송할 때는 한글이 깨진다. 그러므로 인코딩해줘야함.
--%>