package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.EmpDAO;
import vo.Emp;

@WebServlet("/emp")
public class EmploteeServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int empId = Integer.parseInt(req.getParameter("id"));
		
		Gson gson = new Gson();
		EmpDAO dao = new EmpDAO();
		
		res.setContentType("application/json;charset=utf-8");
		PrintWriter out = res.getWriter();
		
		try {
		
			Emp emp = dao.getEmp(empId);
			String text = gson.toJson(emp);
			out.write(text);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			out.write("{}");
			
		}
	
	}
}
