package demo1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;

public class StudentDAO {
	
	static final String INSERT_SQL = "insert into tb_student "
			+ "(no, name, major, grade, phone, id, password) "
			+ "values (?, ?, ?, ?, ?, ?, ?) ";
	
	static final String SELECT_SQL = "select * "
			+ "from tb_student "
			+ "where name like '%' || ? || '%' ";
	
	public void addStudent(StudentVO student) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_SQL);
		pstmt.setInt(1, student.getNo());
		pstmt.setString(2, student.getName());
		pstmt.setString(3, student.getMajor());
		pstmt.setInt(4, student.getGrade());
		pstmt.setString(5, student.getPhone());
		pstmt.setString(6, student.getId());
		pstmt.setString(7, student.getPassword());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public ArrayList<StudentVO> searchStudent(String name) throws SQLException {
		ArrayList<StudentVO> stuList = new ArrayList<StudentVO>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(SELECT_SQL);
		pstmt.setString(1, name);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			StudentVO vo = new StudentVO();
			vo.setNo(rs.getInt("no"));
			vo.setName(rs.getString("name"));
			vo.setMajor(rs.getString("major"));
			vo.setGrade(rs.getInt("grade"));
			vo.setPhone(rs.getString("phone"));
			vo.setId(rs.getString("id"));
			vo.setPassword(rs.getString("password"));
			
			stuList.add(vo);
		}
		
		return stuList;
	}
}
