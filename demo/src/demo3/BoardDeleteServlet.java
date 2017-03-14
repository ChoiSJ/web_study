package demo3;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet(urlPatterns={"/del.hta"})
public class BoardDeleteServlet extends HttpServlet {
	
	public BoardDeleteServlet() {
		System.out.println("BoardDeleteServlet 생성자 실행");
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("BoardDeleteServlet 초기화 함수 실행");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bno = Integer.parseInt(req.getParameter("bno"));
		
		BoardDAO dao = new BoardDAO();
		
		try {
			dao.removeBoard(bno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 게시글 목록을 조회하는 url 을 브라우저가 다시 요청하게 하는 응답을 보내기
		resp.sendRedirect("list.hta");
	}
}
