<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>form 에 입력한 내용을 Ajax 요청으로 전송하는 예제</h1>
<!-- id 중복체크를 할 때와 같이, 페이지 전환이 없이 요청을 하기 위해 ajax가 필요 -->
<form action="insert.jsp" method="post" id="myForm">
   <input type="text" name="email" placeholder="이메일 입력..." />
   <input type="text" name="phone" placeholder="전화번호 입력..." />
   <button type="submit">전송</button>
</form>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script>
   $("#myForm").on("submit", function(){
      var action = $(this).attr("action"); //action 속성의 value 값
      var method = $(this).attr("method"); //method 속성의 value 값
      var query = $(this).serialize(); //폼에 입력한 값을 query string으로 읽어오기
      console.log(query);
      /*
         query string이란?
         email=xxx & phone=xxx 형식의 문자열.
         jquery의 serialize() 기능이 입력한 문자열을 위의 형식으로 바꾸어준다.
      */
      
      //ajax 요청을 통해서 폼에 입력한 내용을 전송한다.
      $.ajax({
         method:method,
         url:action,
         data:query,
         success:function(data){
            console.log(data);
         }
      });
      
      return false; // 폼 전송을 강제로 막아버리기
   });
</script>
</body>
</html>