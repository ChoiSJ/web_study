package demo4;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns={"/loginprocess.hta"})
public class LoginProcessServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 아이디/비밀번호 가져오기
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		if ("hong".equals(id) && "zxcv1234".equals(pwd)) {
			// HttpSession 객체를 생성하기
			HttpSession session = req.getSession(true);
			session.setMaxInactiveInterval(60*30);
			
			// HttpSession 객체에 사용자신원 정보 저장하기
			session.setAttribute("loginedId", id);
			session.setAttribute("loginedName", "홍길동");
			session.setAttribute("recentLoginedDate", "2017.01.11");
			
			// 사용자요청을 리다이엑션 시키기
			resp.sendRedirect("login.hta");
		} else {
			resp.sendRedirect("login.hta?err=fail");
		}
	}
}
