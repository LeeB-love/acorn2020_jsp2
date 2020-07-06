<%@page import="test.dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	QnaDao dao = QnaDao.getInstance();
	dao.delete(num);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("삭제했습니다.")
		location.href="list.jsp"
	</script>
</body>
</html>