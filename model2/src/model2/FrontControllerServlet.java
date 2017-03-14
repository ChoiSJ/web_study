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
		System.out.println("요청 URL:" + requestUrl);
		
		try {
			// mapping.properties 파일 정보를 읽는 Properties 객체 만들기
			Properties prop = new Properties();
			prop.load(this.getClass().getResourceAsStream("../config/mapping.properties"));
			String classFullname = prop.getProperty(requestUrl);
			
			if (classFullname == null) {
				throw new ServletException("유효한 URL 이 아닙니다.");
			}
			
			// 클래스이름에 해당하는 설계도를 읽어와서 객체 생성하기
			Controller controller = (Controller) Class.forName(classFullname).newInstance();
			
			// 유효하지 않은 url 요청인 경우 controller 는 null 이다.
			if (controller == null) {
				throw new ServletException("유효한 URL 이 아닙니다.");
			}
			
			// 컨트롤러 실행하기
			// 컨트롤러는 이동할 경로를 반환한다.
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
