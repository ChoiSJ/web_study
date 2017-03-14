package demo1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/sample9"})
public class Sample9Servlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String name = req.getParameter("name");
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title>검색 결과</title>");
		out.println("</head>");
		out.println("<body>");
		
		try {
			ArrayList<StudentVO> stuList = new StudentDAO().searchStudent(name);
			
			for (StudentVO stu : stuList) {
				out.println("<ul>");
				out.println("<li>");
				out.println("학생번호: "+stu.getNo()+"<br/>");
				out.println("학생이름: "+stu.getName()+"<br/>");
				out.println("학생전공: "+stu.getMajor()+"<br/>");
				out.println("학생연락처: "+stu.getPhone()+"<br/>");
				out.println("</li>");
				out.println("</ul>");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		out.println("</body>");
		out.println("</html>");
	}
}
