package sample2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import vo.Emp;

@WebServlet("/getData")
public class DemoJSONServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String methodName = request.getParameter("callback");
		System.out.println(methodName);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Emp emp = new Emp(100, "홍", "길동", "010-1234-5678", "영업부", 3000000, 0.1);
		Gson gson = new Gson();
		String jsonData = gson.toJson(emp);
		String script = methodName + "("+jsonData+")";
		
		out.write(script);
	}
}
