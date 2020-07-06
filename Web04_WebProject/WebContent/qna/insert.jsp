<%@page import="test.dto.QnaDto"%>
<%@page import="test.dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String contents = request.getParameter("contents");
	
	QnaDto dto = new QnaDto();
	dto.setName(name);
	dto.setContents(contents);

	QnaDao dao = QnaDao.getInstance();
	dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		location.href="list.jsp"
	</script>
</body>
</html>