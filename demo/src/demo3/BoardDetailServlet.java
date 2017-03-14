package demo3;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/detail.hta"})
public class BoardDetailServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 목록페이지에서 클릭한 게시글의 글 번호 알아내기
		int bno = Integer.parseInt(req.getParameter("bno"));
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head><meta charset='utf-8'/><title>글쓰기 폼</title></head>");
		out.println("<body>");
		out.println("<h1>새 상세정보</h1>");
		
		BoardDAO dao = new BoardDAO();
		
		try {
			BoardVO vo = dao.getBoardByNo(bno);
			
			if (vo != null) {
				out.println("<dl>");
				out.println("<dt>번호</dt><dd>"+vo.getNo()+"</dd>");
				out.println("<dt>제목</dt><dd>"+vo.getTitle()+"</dd>");
				out.println("<dt>작성자</dt><dd>"+vo.getWriter()+"</dd>");
				out.println("<dt>추천수</dt><dd>"+vo.getLikes()+"</dd>");
				out.println("<dt>내용</dt><dd>"+vo.getContents()+"</dd>");
				out.println("<dt>등록일</dt><dd>"+vo.getRegdate()+"</dd>");
				out.println("<dt>ip주소</dt><dd>"+vo.getIp()+"</dd>");
				out.println("</dl>");
			} else {
				out.println("<p>글 정보가 존재하지 않습니다.</p>");
			} 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		out.println("<p><a href='list.hta'>목록으로 가기</p>");
		out.println("</body>");
		out.println("</html>");
	}
}
