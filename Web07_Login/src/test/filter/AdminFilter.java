package test.filter;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//web.xml 에서 어노테이션 이용하여 필터 정의와 필터 맵핑을  할 수 있다.
@WebFilter({})
public class AdminFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 클라이언트가 로그인 했는지 여부를 확인한다.
		// 부모 type을 자식 type 으로 casting 한 후 
		HttpServletRequest req = (HttpServletRequest)request;
		//HttpSession 객체의 참조값을 얻어낸다.
		HttpSession session = req.getSession();
		//로그인된 아이디가 있는지 얻어와본다.
		String id=(String)session.getAttribute("id");
		if(id.equals("admin")) { //로그인된 상태
			//요청의 흐름 계속 진행시키기
			chain.doFilter(request, response);
		}else{
			HttpServletResponse res = (HttpServletResponse)response;
			String cPath = req.getContextPath();
			res.sendRedirect(cPath);	 //안된다고 빈창에 알람띄우고 원래 있던 곳으로 ㄱㄱ
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
