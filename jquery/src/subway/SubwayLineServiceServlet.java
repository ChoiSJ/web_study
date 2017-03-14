package subway;

import java.io.IOException;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
@WebServlet("/subway")
public class SubwayLineServiceServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String lineNumber = req.getParameter("line");
		
		// url은 경로를 객체로 반환한다.
		URL url = new URL("http://openapi.seoul.go.kr:8088/587147495765756e3834724d4b5754/json/SearchSTNBySubwayLineService/1/100/"+lineNumber+"/");
		
		// url 에는 inputStream을 반환하는 openStream이 있다..
		res.setContentType("application/json;charset=utf-8");
		
		// writer에 outputStream은 글자 전용이다
		IOUtils.copy(url.openStream(), res.getOutputStream());
	}
}
