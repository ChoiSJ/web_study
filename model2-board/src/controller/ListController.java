package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import model2.Controller;
import vo.BoardVO;

public class ListController implements Controller {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<BoardVO> boardList = new BoardDAO().getAllBoards();
		request.setAttribute("boardList", boardList);
		
		return "forward:list.jsp"; 
	}
}
