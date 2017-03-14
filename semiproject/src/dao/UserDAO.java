package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.UserVO;

public class UserDAO {

	// 회원가입
	public void addUser(UserVO user) throws SQLException {
		String sql = "insert into semi_user"
				+ " (user_no, user_id, user_pwd, user_name, user_birth, user_tel)"
				+ " values(comm_seq.nextval, ?, ?, ?, to_date(?), ?)";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getUserId());
		pstmt.setString(2, user.getUserPwd());
		pstmt.setString(3, user.getUserName());
		pstmt.setString(4, user.getUserBirth());
		pstmt.setString(5, user.getUserTel());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	// ID로 회원정보 가져오기
	public UserVO getUserById(String id) throws SQLException {
		String sql = "select user_no, user_id, user_pwd, user_name, user_birth, user_tel"
				+ " from semi_user where user_id = ?";
		UserVO user = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			user = new UserVO();
			user.setUserNo(rs.getInt("user_no"));
			user.setUserId(rs.getString("user_id"));
			user.setUserPwd(rs.getString("user_pwd"));
			user.setUserName(rs.getString("user_name"));
			user.setUserBirth(rs.getString("user_birth"));
			user.setUserTel(rs.getString("user_tel"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return user;
	}
	
	// 회원리스트
	public ArrayList<UserVO> getUserList() throws SQLException {
		String sql = "select user_no, user_id, user_pwd, user_name, user_birth, user_tel"
				+ " from semi_user"
				+ " order by user_name asc";
		ArrayList<UserVO> userList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			UserVO user = new UserVO();
			user.setUserNo(rs.getInt("user_no"));
			user.setUserId(rs.getString("user_id"));
			user.setUserPwd(rs.getString("user_pwd"));
			user.setUserName(rs.getString("user_name"));
			user.setUserBirth(rs.getString("user_birth"));
			user.setUserTel(rs.getString("user_tel"));
			
			userList.add(user);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return userList;
	}
	
	// NO로 회원정보 가져오기
	public UserVO getUserByNo(int no) throws SQLException {
		String sql = "select user_no, user_id, user_pwd, user_name, user_birth, user_tel"
				+ " from semi_user"
				+ " where user_no = ?";
		UserVO user = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		while (rs.next()) {
			user = new UserVO();
			user.setUserNo(rs.getInt("user_no"));
			user.setUserId(rs.getString("user_id"));
			user.setUserPwd(rs.getString("user_pwd"));
			user.setUserName(rs.getString("user_name"));
			user.setUserBirth(sdf.format(rs.getDate("user_birth")));
			user.setUserTel(rs.getString("user_tel"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return user;
	}
	
	// 기본회원정보변경
	public void updateUser(UserVO user) throws SQLException {
		String sql = "update semi_user"
				+ " set user_id = ?, user_name = ?, user_birth = ?, user_tel = ?"
				+ " where user_no = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getUserId());
		pstmt.setString(2, user.getUserName());
		pstmt.setString(3, user.getUserBirth());
		pstmt.setString(4, user.getUserTel());
		pstmt.setInt(5, user.getUserNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	// 비밀번호변경
	public void updateUserPwd(UserVO user) throws SQLException {
		String sql = "update semi_user"
				+ " set user_pwd = ?"
				+ " where user_id = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user.getUserPwd());
		pstmt.setString(2, user.getUserId());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	// 회원수가져오기
	public int getTotalRows() throws SQLException {
		String sql = "select count(*) cnt"
				+ " from semi_user";
		
		int totalRows = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			totalRows = rs.getInt("cnt");
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return totalRows;
	}
	
	// 페이징처리
	public ArrayList<UserVO> getUserListForPaging(int begin, int end) throws Exception {
		String sql = "select user_no, user_id, user_pwd, user_name, user_birth, user_tel"
				+ " from (select row_number() over (order by user_name asc) rn,"
				+ "			user_no, user_id, user_pwd, user_name, user_birth, user_tel"
				+ " 		from semi_user)"
				+ " where rn >= ? and rn <= ?";
		
		ArrayList<UserVO> userList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			UserVO user = new UserVO();
			user.setUserNo(rs.getInt("user_no"));
			user.setUserId(rs.getString("user_id"));
			user.setUserPwd(rs.getString("user_pwd"));
			user.setUserName(rs.getString("user_name"));
			user.setUserBirth(rs.getString("user_birth"));
			user.setUserTel(rs.getString("user_tel"));
			
			userList.add(user);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return userList;
	}
	
	// 회원탈퇴
	public void deleteUser(int no) throws SQLException {
		String sql = "delete from semi_user where user_no = ?";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
}