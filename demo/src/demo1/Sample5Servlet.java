package demo1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/sample5"})
public class Sample5Servlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String value1 = req.getParameter("house");
		String value2 = req.getParameter("gener");
		String value3 = req.getParameter("memo");
		
		System.out.println("거주지:" + value1);
		System.out.println("성별:" + value2);
		System.out.println("자기소개:" + value3);
	}
}
