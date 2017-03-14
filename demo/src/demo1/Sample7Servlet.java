package demo1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/sample7"})
public class Sample7Servlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String pubName = req.getParameter("pub_name");
		System.out.println(pubName);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>검색결과</h1>");
		out.println("<ul>");
		
		try {
			BookDAO dao = new BookDAO();
			ArrayList<BookVO> bookList = dao.searchBooks(pubName);
			
			for (BookVO book : bookList) {
				String title = book.getTitle();
				String author = book.getAuthor();
				
				out.println("<li>"+title+" ("+author+")</li>");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		out.println("</ul>");
		out.println("</body>");
		out.println("</html>");
	}
}
