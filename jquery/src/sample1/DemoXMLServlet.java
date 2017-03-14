package sample1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/food.xml")
public class DemoXMLServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] korea = {"된장찌개", "김치찌개", "청국장", "빈대떡"};
		String[] china = {"짜장면", "짬뽕", "탕수육", "양장피"};
		String[] japan = {"초밥", "우동", "라멘", "톤카츠"};
		
		response.setContentType("text/xml; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String nation = request.getParameter("na");
		String[] food = {};
		
		if ("kr".equals(nation)) {
			food = korea;
		} else if ("ch".equals(nation)) {
			food = china;
		} else if ("ja".equals(nation)) {
			food = japan;
		} 
		
		StringBuilder sb = new StringBuilder();
		sb.append("<?xml version='1.0' encoding='utf-8' ?>");
		sb.append("<menu>");
		
		for (String name : food) {
			sb.append("<item>"+name+"</item>");
		}
		
		sb.append("</menu>");
		
		out.write(sb.toString());
	}
}
