<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/fortune.jsp</title>
</head>
<body>
	<%
		//FortuneServlet 에서 "fortuneToday" 라는 키값으로 담은 String 타입 얻어오기
		String fortunToday = (String)request.getAttribute("fortuneToday");
	%>
	<p>오늘의 운세 : <strong><%= fortunToday%></strong></p>
	<%-- 웹브라우저에선 jsp의 존재는 알지 못함. 주소창에 Web05_Scope/fortune 이라는 servlet 경로만 뜸 
		분업화되면 jsp에서의 java 코드를 최소화할 수 있다. 복잡한 로직은 servlet에서 처리하고, jsp 페이지에서는
		응답에만 집중하는 셈 --%>
</body>
</html>