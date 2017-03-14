package demo3;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/form.hta"})
public class BoardFormServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head><meta charset='utf-8'/><title>글쓰기 폼</title></head>");
		out.println("<body>");
		out.println("<h1>새 글등록 폼</h1>");
		out.println("<form method='post' action='add.hta'>");
		out.println("글제목:<input type='text' name='title'/><br/>");
		out.println("작성자:<input type='text' name='writer'/><br/>");
		out.println("글내용:<textarea name='contents' rows='3' cols='40'></textarea>");
		out.println("<button>등록</button>");
		out.println("</form>");
		out.println("<p><a href='list.hta'>돌아가기</p>");
		out.println("</body>");
		out.println("</html>");
	}
}
