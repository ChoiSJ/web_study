package model2;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.hta")
public class FrontControllerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestUrl = request.getRequestURI().replace("/model2", "");
		
		try {
			Properties prop = new Properties();
			prop.load(this.getClass().getResourceAsStream("../config/mapping.properties"));
			String classFullname = prop.getProperty(requestUrl);
			
			if (classFullname == null) {
				throw new ServletException("유효한 URL 이 아닙니다.");
			}
			
			Controller controller = (Controller) Class.forName(classFullname).newInstance();
			
			if (controller == null) {
				throw new ServletException("유효한 URL 이 아닙니다.");
			}

			String path = controller.process(request, response);
			
			if (path == null) {
				throw new ServletException("컨트롤러가 이동할 경로를 반환하지 않습니다.");
			}
			
			String[] arr = path.split(":");
			
			if (arr[0].equals("forward")) {
				request.getRequestDispatcher("WEB-INF/views/" + arr[1]).forward(request, response);
			} else if (arr[0].equals("redirect")) {
				response.sendRedirect(arr[1]);
			}
			 
		} catch (ServletException e) {
			throw e; 
		} catch (Exception e) {
			throw new ServletException("요청 처리 중 오류가 발생하였습니다.");
		}
	}
}
