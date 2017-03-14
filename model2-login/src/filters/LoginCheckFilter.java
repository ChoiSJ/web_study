package filters;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter {
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}
	
	@Override
	public void destroy() {
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest httpReq = (HttpServletRequest) request;
		HttpServletResponse httpRes = (HttpServletResponse) response;
		
		// http://localhost/model2-login/home.hta
		
		// 요청 URI 분석
		String requestURI = httpReq.getRequestURI();

		// contextPath 는 웹 애플리케이션을 다른 웹 애플리케이션과 구분짓는 경로이다.
		// 보통은 "/" + 웹 애플리케이션 프로젝트명이다.
		String contextPath = httpReq.getContextPath();
		requestURI = requestURI.replace(contextPath, "");
		
		// 로그인이 필요 없는 url 경로를 담는 Set 객체이다.
		Set<String> urlSet = new HashSet<>();
		urlSet.add("/home.hta");
		urlSet.add("/loginform.hta");
		urlSet.add("/login.hta");
		urlSet.add("/form.hta");
		urlSet.add("/add.hta");
		
		// 로그인 필요한 요청인지 확인
		boolean isRequireLogin = false;
		
		if (!urlSet.contains(requestURI)) {
			isRequireLogin = true;
		}
		
		if (isRequireLogin) {
			// 로그인이 필요한 url 을 요청할 경우
			HttpSession session = httpReq.getSession();
			
			if (session == null) {
				httpRes.sendRedirect("loginform.hta?err=deny");
				return;
			}
			
			if (session.getAttribute("LOGINED_USER") == null) {
				httpRes.sendRedirect("loginform.hta?err=deny");
				return;
			}
			
			filterChain.doFilter(request, response);
			
		} else {
			// 로그인이 필요 없는 url 을 요청할 경우
			filterChain.doFilter(request, response);
		}
	}
}
