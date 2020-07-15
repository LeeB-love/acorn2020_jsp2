<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
	<h1>회원가입 폼입니다.</h1>
	<form action="signup.jsp" method="post" id="myForm">
		<div class="form-group">
			<lable  for="id">아이디</lable>
			<input class="form-control" type="text" name="id" id="id" />
			<button id="checkBtn">중복확인</button>
			<span id="checkResult"></span>
		</div>
		<div class="form-group">
			<lable for="pwd">비밀번호</lable>
			<input class="form-control" type="text" name="pwd" id="pwd" />
		</div>
		<div class="form-group">
			<lable for="email">이메일</lable>
			<input class="form-control" type="text" name="email" id="email" />
		</div>
		<button type="submit">가입</button>
		<button type="reset">취소</button>
	</form>
	<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
	<script>
		//아이디 중복확인을 통과했는지 여부
		var canUseId=false;
		$("#checkBtn").on("click", function(){
			//입력한 아이디를 읽어온다.
			var inputId = $("#id").val();
			//ajax를 이용해서 서버에 보낸 후 결과를 응답 받는다.
			$.ajax({
				method:"GET",
				url:"ckeckid.jsp",
				data:"inputId="+inputId,
				success:function(data){
					//data=>{isExist:true} or {isExist:false}인 object이다.
					if(data.isExist){//이미 존재하는 아이디이므로 사용불가}
					$("#checkResult").text("사용불가");
					canUseId=false;
				}else{//사용가능
					$("#checkResult").text("사용가능");
					canUseId=true;
				}
			}
			});
			//form 안에 있는 일반 버튼을 눌러도 폼이 전송되기 때문에 폼 전송을 막아준다.
			return false;
		})
		//폼에 submit 이벤트가 일어났을 때 호출될 함수 등록
		$("#myForm").on("submit",function(){
			if(!canUseId){//사용 불가한 아이디이면,
				alert("아이디 중복을 확인하세요");
				return false; //폼 제출 막기
			}
		})
	</script>
</body>
</html>