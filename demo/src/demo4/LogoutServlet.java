package demo4;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns={"/logout.hta"})
public class LogoutServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청 객체에 저장된 세선아이디에 해당하는 세션객체 찾기
		HttpSession session = req.getSession(false);
		
		if (session != null) {
			// 검색된 세션객체를 무효화 시켜버린다.
			session.invalidate();
		}
		
		resp.sendRedirect("day3.html");
	}
}
