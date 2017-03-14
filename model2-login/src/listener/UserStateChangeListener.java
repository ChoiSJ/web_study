package listener;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import dao.UserDAO;
import vo.UserVO;

public class UserStateChangeListener implements HttpSessionListener {
	
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
		
		if (user != null) {
			try {
				new UserDAO().changeUserStateN(user.getId());
			} catch (SQLException e) {
				
			}
		}
		
		System.out.println("sessionDestroyed 실행...");
	}
}
