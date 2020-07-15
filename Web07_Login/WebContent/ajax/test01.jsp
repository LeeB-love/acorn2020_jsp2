<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	주소창의 이동없이 클라이언트의 요청에 응답하는 방법 : "ajax"을 활용해서 ㄱㄱ
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button id="getBtn">요청하기</button>
<button id="getBtn2">요청하기2</button>
<button id="getBtn3">요청하기3</button>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script>
	$("#getBtn").on("click", function(){
		//jquery 의 기능을 이용해서 ajax 요청하기
		//$를 object로 보고 ajax 메소드를 호출
		//뭔가를 요청한다고 했을 때, 어디에/ 무슨 방식으로/결과를 받아올 함수/데이터를 보낼 거면(파라미터) 어떻게 보낼것인가를 고민해야함
		$.ajax({
			method:"GET",
			url:"${pageContext.request.contextPath }/ajax/getmsg.jsp",
			data:"num=1&name=leebongha", //파라미터가 없으면 안써도된다.
			success:function(responseData){//결과를 responseData로 받아온다. (서버가 응답하는 문자열)
				console.log(responseData);
			}
		});
	});
	
	$("#getBtn2").on("click",function(){
		$.ajax({
			method:"get", //소문자로 작성해도 ok
			url:"getmsg.jsp", //상대경로 ok
			data:{num:2, name:"해골"}, //요청  파라미터를 object로 전달해도 된다.
			success:function(data){ //지역변수명은 마음대로 작성가능
				console.log(data);
				//javascript 에서 사용하려면  object로 바꿔서 사용해야한다.
				var obj = JSON.parse(data);
				console.log(obj);
				//object로 바꿨기 때문에 쉽게 사용할 수 있다.
				alert(obj.msg);
			}
		})
	})
	
	 $("#getBtn3").on("click", function(){
      $.ajax({
         method:"get",
         url:"getgreet.jsp", //요청 파라미터가 없으면 전달하지 않아도 된다.
         success:function(data){ 
            /*
               getgreet.jsp 페이지에서 contentType을 application/json
               이라고 정확히 명시했기 때문에 jquery가 응답된 문자열을
               object로 바꿔서 전달해준다.
            */
            console.log(data);
            alert(data.greet);
         }
      });
   });
	
</script>
</body>
</html>