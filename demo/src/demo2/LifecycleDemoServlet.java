package demo2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/life"})
public class LifecycleDemoServlet extends HttpServlet {
		
	public LifecycleDemoServlet() {
		System.out.println("LifecycleServlet constuctor is runnig.");
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("init() is running.");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service(req, resp) is running.");
		
		resp.setContentType("text/plane;charset=utf-8");
		PrintWriter out =resp.getWriter();
		out.println("안녕!");
	}
	
	@Override
	public void destroy() {
		System.out.println("destroy() is running.");
	}
}
