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
import vo.Dept;

@WebServlet("/depts")
public class DeptListServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		res.setContentType("application/json;charset=utf-8");
		PrintWriter out = res.getWriter();
		
		Gson gson = new Gson();
		EmpDAO dao = new EmpDAO();
		
		try {
			
			List<Dept> deptList = dao.getAllDepts();
			String text = gson.toJson(deptList);
			out.write(text);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			out.write("[]");
			
		}
	}
}
