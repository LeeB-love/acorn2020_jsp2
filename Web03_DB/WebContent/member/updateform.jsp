<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
<%
	//1. GET 방식 파라미터로 전달되는 수정할 회원의 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	//2. DB에서 해당 회원 한 명의 정보를 읽어온다.
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.getData(num);
	//3. 읽어온 회원 한 명의 정보를 form에 출력해서 응답한다.
%>

	<div class="navbar navbar-expand-sm navbar-light bg-light">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">Acorn</a>

		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/board/list.jsp">Board</a></li>
		</ul>
	</div>

	<div class="container">
	<br />
	<br />
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
		<li class="breadcrumb-item"><a href="list.jsp">회원목록</a></li>
		<li class="breadcrumb-item active">회원정보 수정</li>
	</ol>	
	<br />
		<h1>회원정보 수정</h1>
		<form action="${pageContext.request.contextPath }/member/update.jsp" method="post">
			<div class="form-group">
				<%-- form을 제출했을 떄 회원의 번호가 전송되도록 input type="hidden"에
				회원 번호를 출력해놓는다. --%>
				<input class="form-control" type="hidden" name="num" value="<%=dto.getNum() %>" />
				<label for="num">번호</label>
			</div>
			<div class="form-group">
				<!-- disabled 속성이 추가된 input 요소는 수정이 불가하고 form을 제출했을 때 전송도 되지 않는다. -->
				<input class="form-control" type="text" id="num" value="<%=dto.getNum() %>" disabled/>
				<label for="name">이름</label>
			</div>
			<div class="form-group">
				<input class="form-control" type="text" id="name" name="name" value="<%=dto.getName() %>" />
				<label for="addr">주소</label>
			</div>
			<div>
				<input class="form-control" type="text" id="addr" name="addr" value="<%=dto.getAddr() %>" />
			</div>
			<button class="btn btn-outline-primary" type="submit">수정</button>
			<button class="btn btn-outline-warning" type="reset">취소</button>
		</form>
	</div>
</body>
</html>











