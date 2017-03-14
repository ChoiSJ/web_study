package sample1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/food.json")
public class DemoJSONServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String korea = "[\"된장찌개\",\"김치찌개\",\"청국장\",\"빈대떡\"]";
		String china = "[\"짜장면\",\"짬뽕\",\"탕수육\",\"양장피\"]";
		String japan = "[\"초밥\",\"돈까스\",\"우동\",\"라멘\"]";
		
		String nation = req.getParameter("na");
		
		res.setContentType("application/json;charset=utf-8");
		
		PrintWriter out = res.getWriter();
		
		if ("kr".equals(nation)) {
			out.write(korea);

		}else if ("ch".equals(nation)){
			out.write(china);
			
		}else if ("ja".equals(nation)) {
			out.write(japan);
			
		}else {
			out.write("[]");
			
		}
		
		
	}
}
