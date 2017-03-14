package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model2.Controller;
import vo.UserVO;

public class LogoutController implements Controller {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		if (session != null) {
			UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
			
			if (user != null) {
				new UserDAO().changeUserStateN(user.getId());
			}
			
			session.invalidate();
		}
		
		return "redirect:home.hta";
	}
}
