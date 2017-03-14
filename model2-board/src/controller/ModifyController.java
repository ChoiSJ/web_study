package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import model2.Controller;
import vo.BoardVO;

public class ModifyController implements Controller {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		BoardVO board = new BoardVO();
		board.setNo(Integer.parseInt(request.getParameter("no")));
		board.setTitle(request.getParameter("title"));
		board.setWriter(request.getParameter("writer"));
		board.setContents(request.getParameter("contents"));
		
		new BoardDAO().modifyBoardByNo(board);
		
		return "redirect:list.hta";
	}
}
