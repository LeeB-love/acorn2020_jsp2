package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter{
	//인코딩 정보를 저장할 필드 선언 --> web.xml에 선언한 내용을 읽어서 여기에 저장
	private String encoding;
	
	
/*
 * 1.javax.servlet.Filter 인터페이스를 구현한다.
 * 2. web.xml 문서에 필터를 정의하고 맵핑한다.
 * 3. doFilter() 메소드 안에서 원하는 작업을 한다.
 */
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
	//필터가 동작해야할 때 호출되는 메소드
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if(request.getCharacterEncoding()==null) {
			//인코딩 설정하기
		request.setCharacterEncoding(encoding);
		}
		//요청의 흐름 계속 이어가기
		chain.doFilter(request, response);
		
		//filter를 통해 요청에 대한 응답하기 전에 먼저 해야할 일들을 설정할 수 있다. (요청 전에 가로채기~)
		//redirect도 시킬 수 있음.	
	}
	
	//필터가 최초 사용될 때 1번 호출되는 메소드
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// web.xml 문서에 있는 내용을 읽어서 필드에 저장한다.
		encoding = filterConfig.getInitParameter("encoding");  //web.xml에 저장된 utf-8
		
	}

}

/*
	 * 프로젝트 우클릭 -> Java EE Tools -> Generate Deployment Descriptor Stub 을 클릭하면
	* web.xml 파일이 생긴다. 이 파일을 통해 Apache Tomcat WebServer을 커스터마이징할 수 있다. 
	* Tomcat 애플리케이션이 web.xml을 읽어서 동작을 준비하기 때문에... 애플리케이션 소스코드를 수정하지 않아도
	* web.xml 설정을 통해 원하는 방식으로 서버를 돌릴 수 있다.  
*/
