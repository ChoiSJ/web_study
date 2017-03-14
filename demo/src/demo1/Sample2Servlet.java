package demo1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/sample2"})
public class Sample2Servlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("SampleServlet 의 doGet() 메소드 실행...");
		
		String value = req.getParameter("id");
		System.out.println("클라이언트가 서버로 전달한 id값:" + value);
	}
}
