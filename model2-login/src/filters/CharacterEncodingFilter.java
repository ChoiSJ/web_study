package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

//@WebFilter(urlPatterns="*.hta")
public class CharacterEncodingFilter implements Filter {
	
	private String defaultEncoding = null;
	
	// Filter 객체가 생성되고 초기화작업을 위해서 딱 한 번 실행된다.
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		defaultEncoding = filterConfig.getInitParameter("encoding");
		
		if (defaultEncoding == null) {
			defaultEncoding = "UTF-8";
		}
	}
	
	// Filter 객체가 소멸되기 전에 딱 한 번 실행된다.
	// 연결된 리소스(자원) 해제 작업을 코딩하면 된다.
	// 일반적으로 아무 작업도 안 한다.
	@Override
	public void destroy() {
			
	}
	
	// Filter 객체의 실질적인 작업 내용을 구현하는 메소드다.
	// 클라이언트의 요청을 가로채서 서블릿/JSP 실행 전에 매번 실행된다.
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		request.setCharacterEncoding(defaultEncoding);
		
		// 이 필터 다음 필터의 doFilter() 메소드를 실행한다.
		// 필터가 더 이상 존재하지 않으면 서블릿/JSP service() 메소드를 실행한다.
		// 이 코드 이전에 작성한 코드는 전처리코드가 되고
		// 이 코드 이후에 작성한 코드는 후처리코드가 된다.
		// 이반적으로 후처리코드를 작성하는 경우는 거의 없다.
		filterChain.doFilter(request, response);
	}
}
