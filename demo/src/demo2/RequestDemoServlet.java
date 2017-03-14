package demo2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"/req"})
public class RequestDemoServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] languages = req.getParameterValues("lan");
		
		// 선택된 체크박스의 값을 가져온다.
		// 선택된 체크박스가 하나도 없는 경우 null 이 반환된다.
		if (languages != null) {
			for (String lang : languages) {
				System.out.println(lang);
			}
		}
		
		// 자격증 입력필드의 값을 조회한다.
		// 자격증 입력필드에 하나도 값이 입력되어 있지 않아도 "빈 공백" 인 값은 무조건 전달된다.
		String[] licences = req.getParameterValues("licence");
		
		for (String name : licences) {
			System.out.println("자격증이름:" + name);
		}
	}
}
