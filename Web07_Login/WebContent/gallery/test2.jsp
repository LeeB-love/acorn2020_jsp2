<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/test.jsp</title>
</head>
<body>
<div id="wrapper">
	
</div>
	<h1>이미지 파일 업로드 테스트</h1>
	<form id="myForm" action="test_upload2.jsp" method="post" enctype="multipart/form-data">
		<input type="text" name="title" placeholder="설명 입력..." />
		<input type="file" name="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif" /><br />
		<button type="submit">업로드</button>
	</form>
	<!-- jquery 로딩 -->
	<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
	<!-- jquery 플러그인 로딩 === ajaxForm() 이 생긴다.-->
	<script src="${pageContext.request.contextPath }/js/jquery.form.min.js"></script>
	<!-- custon javascript 코딩 -->
	<script>
		//id 가 myForm 인 form 에 submit 이벤트가 일어나면 페이지 전환없이 제출하기.
		$("#myForm").ajaxForm(function(data){
		      //data는 {imageSrc:"/upload/xxx.jpg"}형식의 object이다.
		      console.log(data);
		      $("<img/>")
		      .attr("src","${pageContext.request.contextPath}"+data.imageSrc)
		      .appendTo("#wrapper");
		});
	</script>
</body>
</html>