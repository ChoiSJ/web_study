package demo4;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns={"/mail.hta"})
public class MailServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청객체에 들어 있는 세션아이디로 세션객체 찾기
		HttpSession session = req.getSession(false);
		
		if (session == null) {
			//System.out.println("메일 보기는 로그인 된 사람만 볼 수 있습니다.");
			resp.sendRedirect("login.hta?err=deny");
		} else {
			String userid = (String) session.getAttribute("loginedId");
			String username = (String) session.getAttribute("loginedName");
			
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head><meta charset='utf-8'><title>메일</title></head>");
			out.println("<body>");
			out.println("<h1>"+username+" ("+userid+")님의 메일 리스트</h1>");
			out.println("<p>10개의 읽지 않은 메일이 있습니다.</p>");
			out.println("</body>");
			out.println("</html>");
		}
	}
}
