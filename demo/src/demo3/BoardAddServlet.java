package demo3;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/add.hta"})
public class BoardAddServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		// 클라이언트가 전달한 값 꺼내기
		String title = req.getParameter("title");
		String writer = req.getParameter("writer");
		String contents =req.getParameter("contents");
		
		// BoardVO 객체를 생성해서 값 담기
		BoardVO board = new BoardVO();
		board.setTitle(title);
		board.setWriter(writer);
		board.setContents(contents);
		board.setIp(req.getRemoteAddr());
		
		// BoardDAO 의 저장하는 메소드에게 BoardVO 객체 전달해서 DB 에 저장하기
		BoardDAO dao = new BoardDAO();
		try {
			dao.addNewBoard(board);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 목록을 볼 수 있는 url 을 브라우저에게 응답으로 제공해서 게시글 목록을 다시 요청하게 하기
		resp.sendRedirect("list.hta");
	}
}
