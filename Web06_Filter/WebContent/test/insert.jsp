<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post 방식 전송했을 때 한글이 깨지지 않도록
	//request.setCharacterEncoding("utf-8");  --> filter에서 처리함...
	String msg = request.getParameter("msg");
	System.out.println("msg : "+msg);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>요청을 처리했습니다.</h1>
	<p>당신이 전송한 문자열 : <strong><%=msg %></strong></p>
</body>
</html>