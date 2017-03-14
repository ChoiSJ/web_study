package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model2.Controller;
import vo.UserVO;

public class ListController implements Controller {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ListController 의 process() 실행...");
		
		UserDAO userDao = new UserDAO();
		List<UserVO> userList = userDao.getAllUser();
		
		request.setAttribute("users", userList);
		
		return "forward:list.jsp";
	}
}
