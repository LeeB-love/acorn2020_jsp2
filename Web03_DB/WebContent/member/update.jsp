<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. form 전송되는 수정할 회원의 정보를 읽어온다.
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	//2. DB에 수정반영한다.
	MemberDto dto = new MemberDto(num, name, addr);
	boolean isSuccess = MemberDao.getInstance().update(dto);
	//3. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>

	<%if(isSuccess){ %>
		<script>
			alert("<%=dto.getName() %>님의 정보가 수정되었습니다.");
			location.href="list.jsp"
		</script>
	<%}else{ %>
		<script>
			alert("수정 실패");
			location.href="list.jsp"
		</script>
	<%} %>
</body>
</html>