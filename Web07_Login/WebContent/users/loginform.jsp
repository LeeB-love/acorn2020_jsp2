<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
<%
	//url 파라미터가 넘어오는지 읽어와보기
	String url = request.getParameter("url");
	if(url==null){//만약 목적지 정보가 없다면
		String cPath = request.getContextPath();
		url=cPath+"/index.jsp"; // "/"하나만 써도 index.jsp 페이지로 넘어가긴 하지만, 명시적으로 index.jsp 써주기 
	}else{
		
	}
%>
	 <div class="container">
	 	<h1>로그인</h1>
	 	<form action="login.jsp" method="post">
	 	<%--원래 가려던 목적지 정보를 url 이라는 파라미터명으로 가지고 간다. --%>
	 		<input type="hidden" name="url" value="<%=url %>" />
	 		<div class="form-group">
	 			<label for="id">아이디</label>
	 			<input class="from-control" type="text" name="id" id="id" />
	 		</div>
	 		<div class="form-group">
	 			<label for="pwd">비밀번호</label>
	 			<input class="from-control" type="text" name="pwd" id="pwd" />
	 		</div>
	 		<button type="submit">로그인</button>
	 	</form>
	 </div>
</body>
</html>