package sample1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/food")
public class DemoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String koreaFood = "된장국,김치찌개,청국장,빈대떡";
		String chinaFood = "짜장면,짬뽕,탕수육,양장피";
		String japanFood = "초밥,우동,라멘,톤카츠,오코노미야키";
		
		String nation = request.getParameter("na");
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if ("kr".equals(nation)) {
			out.write(koreaFood);
		} else if ("ch".equals(nation)) {
			out.write(chinaFood);
		} else if ("ja".equals(nation)) {
			out.write(japanFood);
		} else {
			out.write("none");;
		}
	}
}
