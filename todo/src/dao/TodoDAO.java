package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.TodoVO;

public class TodoDAO {
	
	public ArrayList<TodoVO> getTodoListForPaging(int begin, int end, String userId) throws Exception {
		String sql = "select no, category, title, description, day, location, completed, user_id "
				+ "from (select row_number() over (order by no desc) rn, "
				+ "			no, category, title, description, day, location, completed, user_id "
				+ "		from tb_todo"
				+ "		where user_id = ?) "
				+ "where rn >= ? and rn <= ? ";
		
		ArrayList<TodoVO> todoList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userId);
		pstmt.setInt(2, begin);
		pstmt.setInt(3, end);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			TodoVO todo = new TodoVO();
			todo.setNo(rs.getInt("no"));
			todo.setCategory(rs.getString("category"));
			todo.setTitle(rs.getString("title"));
			todo.setDescription(rs.getString("description"));
			todo.setLocation(rs.getString("location"));
			todo.setDay(rs.getString("day"));
			todo.setCompleted(rs.getString("completed"));
			todo.setUserid(rs.getString("user_id"));
			
			todoList.add(todo);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return todoList;
	}
	
	public int getTotalRows(String userId) throws SQLException {
		String sql = "select count(*) cnt from tb_todo where user_id = ? ";
		
		int totalRows = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			totalRows = rs.getInt("cnt");
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return totalRows;
	}
	
	public void addTodo(TodoVO todo) throws SQLException {
		String sql = "insert into tb_todo "
				+ "(no, category, title, description, location, day, completed) "
				+ "values (comm_seq.nextval, ?, ?, ?, ?, ?, 'No') ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, todo.getCategory());
		pstmt.setString(2, todo.getTitle());
		pstmt.setString(3, todo.getDescription());
		pstmt.setString(4, todo.getLocation());
		pstmt.setString(5, todo.getDay());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public ArrayList<TodoVO> todoList(String userId) throws SQLException {
		ArrayList<TodoVO> todoList = new ArrayList<>();
		
		String sql = "select no, category, title, description, location, day, completed, user_id "
				+ "from tb_todo "
				+ "where user_id = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			TodoVO todo = new TodoVO();
			todo.setNo(rs.getInt("no"));
			todo.setCategory(rs.getString("category"));
			todo.setTitle(rs.getString("title"));
			todo.setDescription(rs.getString("description"));
			todo.setLocation(rs.getString("location"));
			todo.setDay(rs.getString("day"));
			todo.setCompleted(rs.getString("completed"));
			todo.setUserid(rs.getString("user_id"));
			
			todoList.add(todo);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return todoList;
	}
	
	public void deleteTodo(int no) throws SQLException {
		String sql = "delete from tb_todo where no = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void completedTodo(int no) throws SQLException {
		String sql = "update tb_todo set completed = 'Yes' where no = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public TodoVO detailTodo(int no) throws SQLException {
		TodoVO todo = null;
		
		String sql = "select no, category, title, description, location, day, completed "
				+ "from tb_todo "
				+ "where no = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			todo = new TodoVO();
			todo.setNo(rs.getInt("no"));
			todo.setCategory(rs.getString("category"));
			todo.setTitle(rs.getString("title"));
			todo.setDescription(rs.getString("description"));
			todo.setLocation(rs.getString("location"));
			todo.setDay(rs.getString("day"));
			todo.setCompleted(rs.getString("completed"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return todo;
	}
}
