package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import model2.Controller;

public class ModyfiLikeCountController implements Controller {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("mno"));
		new BoardDAO().plusLikeCount(no);
		
		return "redirect:list.hta";
	}
}
