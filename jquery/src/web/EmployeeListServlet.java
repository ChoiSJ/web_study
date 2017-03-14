package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.EmpDAO;
import vo.Emp;

@WebServlet("/emps")
public class EmployeeListServlet  extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		res.setContentType("application/json;charset=utf-8");
		PrintWriter out = res.getWriter();
		Gson gson = new Gson();
		int deptId = Integer.parseInt(req.getParameter("id"));
		EmpDAO dao = new EmpDAO();
		try {
			List<Emp> empList = dao.getEmps(deptId);
			String text = gson.toJson(empList);
			out.write(text);
		} catch (SQLException e) {
			e.printStackTrace();
			out.write("[]");
			
		}
	
	}
}
