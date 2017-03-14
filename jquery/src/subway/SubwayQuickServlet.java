package subway;

import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;

@WebServlet("/quick")
public class SubwayQuickServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String departure = req.getParameter("d");
		String arrival = req.getParameter("a");
		
		departure = URLEncoder.encode(departure, "utf-8");
		arrival = URLEncoder.encode(arrival, "utf-8");
		
		URL url = new URL("http://swopenAPI.seoul.go.kr/api/subway/446b4e476465756e3231734870436a/json/shortestRoute/0/5/"+departure+"/"+arrival);
		res.setContentType("application/json;charset=utf-8");
		
		IOUtils.copy(url.openStream(), res.getOutputStream());
		
	}
	
}
