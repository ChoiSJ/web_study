package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model2.Controller;
import vo.UserVO;

public class LoginController implements Controller {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = request.getParameter("userid");
		String userPwd = request.getParameter("userpwd");
		
		UserDAO dao = new UserDAO();
		UserVO user = dao.getUserById(userId);
		
		if (user == null) {
			return "redirect:loginform.hta?err=fail";
		}
		
		if (!user.getPwd().equals(userPwd)) {
			return "redirect:loginform.hta?err=fail";
		}
		
		HttpSession session = request.getSession(true);
		session.setAttribute("LOGINED_USER", user);
		dao.changeUserStateY(userId);
		
		return "redirect:home.hta";
	}
}
