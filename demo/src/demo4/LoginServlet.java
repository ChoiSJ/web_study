package demo4;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns={"/login.hta"})
public class LoginServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청객체가 가지고 있는 sessionId 에 해당 HttpSession 객체를 찾아서 반환한다.
		// 첫 방문이거나 로그인하지 않은 사용자의 요청이라면 session 의 값은 null 이다.
		HttpSession session = req.getSession(false);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");		
		out.println("<head><meta charset='utf-8'><title>로그인</title></head>");
		out.println("<body>");
		out.println("<h1>로그인</h1>");
		
		if (session == null) {
			String err = req.getParameter("err");
			
			if (err != null) {
				if ("deny".equals(err)) {
					out.println("<p style='color:crimson;'>로그인이 필요한 서비스입니다.</p>");
				} else if ("fail".equals(err)) {
					out.println("<p style='color:crimson;'>아이디 혹은 비밀번호가 일치하지 않습니다.</p>");
				}
			}
			
			// 로그인 이전
			out.println("<form method='post' action='loginprocess.hta'>");
			out.println("아이디:<br/><input type='text' name='id'><br/>");
			out.println("비밀번호:<br/><input type='password' name='pwd'><br/>");
			out.println("<input type='submit' value='로그인'/>");
			out.println("</form>");
		} else {
			// 로그인한 사용자
			String userid = (String) session.getAttribute("loginedId");
			String username = (String) session.getAttribute("loginedName");
			String recentDate = (String) session.getAttribute("recentLoginedDate");
			
			out.println("<p>"+username+"("+userid+")님 환영합니다.</p>");
			out.println("<p>최근로그인 날짜:"+recentDate+"</p>");
			out.println("<p><a href='mail.hta'>메일</p>");
			out.println("<p><a href='logout.hta'>로그아웃</p>");
		}
		
		out.println("</body>");
		out.println("</html>");
	}
}
