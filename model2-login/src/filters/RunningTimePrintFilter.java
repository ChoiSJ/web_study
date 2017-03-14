package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class RunningTimePrintFilter implements Filter {
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}
	
	@Override
	public void destroy() {
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		// 전처리 코드
		HttpServletRequest httpReq = (HttpServletRequest) request;
		String requestURI = httpReq.getRequestURI();
		String contextPath = httpReq.getContextPath();
		requestURI = requestURI.replace(contextPath, "");
		
		System.out.println("["+requestURI+"] 에 대한 요청 처리 시작");
		long begin = System.currentTimeMillis();
		
		filterChain.doFilter(request, response);
		
		// 후처리 코드
		System.out.println("["+requestURI+"] 에 대한 요청 처리 종료");
		long end = System.currentTimeMillis();
		
		System.out.println("["+requestURI+"] 에 대한 요청 소요 시간:" + (end-begin) + "밀리초");;
	}
}

