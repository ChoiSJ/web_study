package demo1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/sample4"})
public class Sample4Servlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String value1 = req.getParameter("userid");
		String value2 = req.getParameter("userpwd");
		
		System.out.println("아이디:" + value1);
		System.out.println("비밀번호:" + value2);
	}
}
