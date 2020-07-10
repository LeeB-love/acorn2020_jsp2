package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//오늘의 운세를 얻어오는 비즈니스 로직을 수행한다.
		String fortuneToday="동쪽으로 가면 귀인을 만나요";
		//비즈니스 로직의 수행결과 data를 HttpServletRequest 객체에 담는다.
		//(request 영역(scope)에 담는다 라고도 한다.)
		//"fortuneToday" 라는 키값으로 String type 이 참조값 담기
		req.setAttribute("fortuneToday", fortuneToday);
		//jsp 페이지로 응답을 위힘한다. (forward 이동)
		RequestDispatcher rd = req.getRequestDispatcher("/test/fortune.jsp"); //메소드를 호출하면서 응답이 위임될 페이지가 어디있는지 전달하는 것.
		rd.forward(req, resp);//응답할 객체를 같이 위임된 페이지에 전달하는 것.(fortune servlet to forutne.jsp)
		//위임을 하는 이유는 servlet은 html 형식의 응답을 하기엔 적절치 않기 때문에...
		//
	}
}
