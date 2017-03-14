package demo2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/res"})
public class ResponseDemoServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 응답컨텐츠의 타입과 문자인코딩방식 지정하기
		//resp.setContentType("text/plane;charset=utf-8");
		//PrintWriter out = resp.getWriter();
		//out.println("안녕");
		
		// 브라우저에게 서버로 다시 요청할 url 을 내려보내기
		resp.sendRedirect("res2");
	}
}
