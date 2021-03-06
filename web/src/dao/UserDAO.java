package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.ConnectionUtil;
import vo.UserVO;

public class UserDAO {
	
	public UserVO getUserById(String id) throws SQLException {
		String sql = "select user_id, user_pwd, user_name, user_phone, user_addr, user_point, user_regdate "
				+ "from tb_user "
				+ "where user_id = ? ";
		
		UserVO user = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			user = new UserVO();
			user.setId(rs.getString("user_id"));
			user.setPwd(rs.getString("user_pwd"));
			user.setName(rs.getString("user_name"));
			user.setPhone(rs.getString("user_phone"));
			user.setAddr(rs.getString("user_addr"));
			user.setPoint(rs.getInt("user_point"));
			user.setRegdate(rs.getDate("user_regdate"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return user;
	}
	
	public void addUser(UserVO user) throws SQLException {
		String sql = "insert into tb_user "
				+ "(user_id, user_pwd, user_name, user_phone, user_addr) "
				+ "values (?, ?, ?, ?, ?) ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getPwd());
		pstmt.setString(3, user.getName());
		pstmt.setString(4, user.getPhone());
		pstmt.setString(5, user.getAddr());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
}
