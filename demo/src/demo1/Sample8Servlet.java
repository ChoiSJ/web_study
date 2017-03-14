package demo1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/sample8"})
public class Sample8Servlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		StudentVO vo = new StudentVO();
		vo.setNo(Integer.parseInt(req.getParameter("no")));
		vo.setName(req.getParameter("name"));
		vo.setMajor(req.getParameter("major"));
		int grade = Integer.parseInt(req.getParameter("grade"));
		vo.setGrade(grade);
		vo.setPhone(req.getParameter("phone"));
		vo.setId(req.getParameter("id"));
		vo.setPassword(req.getParameter("password"));
		
		try {
			StudentDAO dao = new StudentDAO();
			dao.addStudent(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");		
		out.println("<title>학생 등록 완료</title>");				
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>학생 등록이 완료되었습니다.</h1>");	
		out.println("</body>");
		out.println("</html>");
	}
}
