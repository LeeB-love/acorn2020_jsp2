<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	UsersDto dto = UsersDao.getInstance().getData(id);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/updateform.jsp</title>
<style>
	/* 프로필 업로드 폼을 화면에서 숨긴다. */
	#profileForm{
		display:none;
	}
	/* 이미지를 작은 원형으로 만든다. */
	#profileImage{
		width : 100px;
		height : 100px;
		border : 1px soled #cecece;
		border-radius : 50%;
		curser : pointer;
	}
</style>
</head>
<body>
<div class="container">
	<h1>회원정보 수정 폼 입니다.</h1>
	<% if(dto.getProfile()==null){%>
		<img id="profileImage" src="${pageContext.request.contextPath }/images/yellowbird.png" /> <%-- 기본이미지 --%>
	<%}else{ %>
		<img src="${pageContext.request.contextPath }<%=dto.getProfile() %>"/>
	<%} %>
	<form action="update.jsp" method="post">
		<input type="hidden" name="profile" id="profile" value="<%=dto.getProfile()%>"/>
		<div class="form-group">
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" value="<%=id%>" disabled/>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" value="<%=dto.getEmail()%>"/>		
		</div>
		<button type="submit">수정</button>
		<button type="reset">취소</button>
	</form>
	<form action="profile_upload.jsp" method="post" enctype="multipart/form-data" id="profileForm">
		<input type="file" name="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG" id="image" />
	</form>
</div>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.form.min.js"></script>
<script>
	// 프로필 이미지를 클릭했을 때 실행할 함수 등록
	$("#profileImage").on("click", function(){
		//input type="file"을 강제 클릭한다. => 원하는 이미지가 선택되면 이미지가 input 되는 시점에 change event가 일어난다. event가 일어나면 바로 제출
		$("#image").click();
	})
	
	//이미지를 선택했을 때 실행할 함수 등록
	$("#image").on("change", function(){
      //폼을 강제 제출한다.
		$("#profileForm").submit();
	});

	//폼이 ajax로 제출될 수 있도록 플러그인을 동작시키낟.
	$("#profileForm").ajaxForm(function(data){
		//프로필 이미지를 업데이트 한다.
		$("#profileImage").attr("src", "${pageContext.request.contextPath }"+data.imageSrc);
		//회원정보 수정폼 전송될 때 같이 전송되도록 한다.
		$("#profile").val(data.imageSrc); //input type="hidden"의 value값
	});
</script>
</body>
</html>














