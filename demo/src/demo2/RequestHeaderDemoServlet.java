package demo2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/h"})
public class RequestHeaderDemoServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String value1 = req.getHeader("host");
		String value2 = req.getHeader("user-agent");
		String value3 = req.getHeader("accept-encoding");
		
		System.out.println(value1);
		System.out.println(value2);
		System.out.println(value3);
	}
}
