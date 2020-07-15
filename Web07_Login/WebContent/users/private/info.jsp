<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	UsersDto dto = UsersDao.getInstance().getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.jsp</title>
</head>
<body>
	<h1>회원 정보 페이지입니다.</h1>
	<table>
		<tr>
			<th>아이디</th>
			<td><%=id %></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><a href="pwd_updateform.jsp">수정하기</a></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<a href="updateform.jsp">개인정보 수정</a>
	<a href="javascript : deleteConfirm()">탈퇴</a>
	<script>
		function deleteConfirm(){
			var isDelete = confirm("<%=id%> 회원님 탈퇴하시겠습니까?");
			if(isDelete){
				location.href="delete.jsp";
			}
		}
	</script>
</body>

</html>