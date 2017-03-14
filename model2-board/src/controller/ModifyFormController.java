package controller;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import model2.Controller;
import vo.BoardVO;

public class ModifyFormController implements Controller {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("mno"));
		BoardVO board = new BoardDAO().getBoardByNo(no);
		String regdate = new SimpleDateFormat("yyyy-MM-dd").format(board.getRegdate());
		request.setAttribute("board", board);
		request.setAttribute("regdate", regdate);
		
		return "forward:modifyform.jsp";
	}
}
