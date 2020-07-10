<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//1. 폼 전송되는 아이디 비밀번호를 읽어온다.
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
	//2. DB에서 해당 회원정보가 있는 select를 해본다.
		boolean isVaild = false; //유효한 정보인지 여부
		if(id.equals("gura")&&pwd.equals("1234")){
			isVaild = true;
		//로그인 했다는 의미에서 세션 영역에 id라는 키값으로 아이디를 담는다.
		session.setAttribute("id", id);
	}
	//3. 회원정보가 맞으면 로그인 처리 후 응답 틀리면 로그인 실패라고 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(isVaild){%>
		<p><%=id %>님 로그인 되었습니다. <a href="../index.jsp">확인</a></p>
	<%}else{ %>
		<p>로그인 실패. 아이디와 비밀번호를 확인해주세요. <a href="../index.jsp">다시시도</a></p>
	<%} %>
</body>
</html>