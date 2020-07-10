<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>

	<div class="navbar navbar-expand-sm navbar-light bg-light">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">Acorn</a>

		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/board/list.jsp">Board</a></li>
		</ul>
	</div>

<%
	//MemberDao 객체의 참조값 얻어오기
	MemberDao dao = MemberDao.getInstance();
	//회원 목록 얻어오기
	List<MemberDto> list = dao.getList();
%>
<div class="container">
	<br />
	<br />
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
		<li class="breadcrumb-item">회원목록</li>
	</ol>	
	<br />
		<p class="font-weight-light text-primary" style="font-size: xx-large;">
		<i class="fas fa-user-friends"></i> 회원 목록 </p>
	<table class="table">
		<thead class="thead-light">
			<tr style="text-align: center;">
				<th scope="col">#</th>
				<th scope="col">이름</th>
				<th scope="col">주소</th>
				<th scope="col" width="100">수정</a></th>
				<th scope="col" width="100">삭제</th>
			</tr>
		</thead>
		<tbody>
			<% for(MemberDto tmp : list){%>
			<tr style="text-align: center;">
				<td scope="row"><%=tmp.getNum() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getAddr() %></td>
				<td><a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a></td>
				<td><a href="javascript : deleteConfirm(<%= tmp.getNum()%>); "><i class="fas fa-minus-circle"></i></a></td>
			</tr>
			<%} %>
		</tbody>
	</table>
	<a href="insertform.jsp"><button class="btn btn-light">회원 추가 하러 가기</button></a>
</div>
<script>
	function deleteConfirm(num) {
		var isDelete = confirm(num + " 번 글을 삭제하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp?num="+num;
		}
	}
</script>
</body>
</html>








