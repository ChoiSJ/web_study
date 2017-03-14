package demo1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/sample3"})
public class Sample3Servlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Sample 3 Servlet 의 doGet() 메소드 실행...");
		
		String value = req.getParameter("keyword");
		System.out.println("전달받은 검색어:" + value);
	}
}
