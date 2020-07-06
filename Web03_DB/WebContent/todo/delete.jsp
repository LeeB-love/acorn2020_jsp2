<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//할일을 삭제해야하는데 몇 번글을 삭제하지?
	//GET 방식 파라미터로 전달되는 삭제할 글번호를 읽어와서 숫자로 바꿔준다.
	int num = Integer.parseInt(request.getParameter("num"));
	//DB에서 실제로 삭제한다.
	TodoDao dao = TodoDao.getInstance();
	dao.delete(num);
	//응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("삭제했습니다.")
		location.herf="list.jsp"
	</script>
</body>
</html>