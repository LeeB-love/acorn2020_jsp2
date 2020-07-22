<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/pwd_updateform.jsp</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	UsersDto dto = UsersDao.getInstance().getData(id);
%>
<div class="container">
	<h1>비밀번호 수정폼</h1>
	<form action="pwd_update.jsp" method="post" id="myForm">
		<div class="form-group">
			<label for="pwd">기존 비밀번호</label>
			<input type="text" name="pwd" id="pwd" value = "<%=dto.getPwd() %>"/>
		</div>
		<div class="form-group">
			<label for="newPwd">새 비밀번호</label>
			<input type="password" name="newPwd" id="newPwd"/>
		</div>
		<div class="form-group">
			<label for="newPwd2">새 비밀번호 확인</label>
			<input type="password" name="newPwd2" id="newPwd2"/>
		</div>
		<button type="submit">수정하기</button>
	</form>
</div>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script>
	//id 가 myForm 인 곳에 submit 이벤트가 일어났을 때 실행할 함수 등록
	$("#myForm").on("submit",function(){
		//입력한 새로운 비밀번호 2개를 읽어와서
		var pwd1=$("#newPwd").val();
		var pwd2=$("#newPwd2").val();
		//만일 일치하지 않으면
		if(pwd1 != pwd2){
			//알림을 띄우고
			alert("새 비밀번호가 일치하지 않습니다.")
			//비밀번호 입력란을 초기화하고 포커스 주기
			$("#newPwd").val("").focus();
			$("#newPwd2").val("");
			//폼전송을 막는다.
			return false;
		}
	});
</script>
</body>
</html>