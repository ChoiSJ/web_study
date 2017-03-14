package dao;

import java.sql.SQLException;

import util.SqlMapperUtil;
import vo.UserVO;

public class UserDAO {
	
	public void addNewUser(UserVO user) throws SQLException {
		SqlMapperUtil.getSqlMapper().insert("addNewUser", user);
	}
	
	public UserVO getUserById(String userId) throws SQLException {
		return (UserVO) SqlMapperUtil.getSqlMapper().queryForObject("getUserById", userId);
	} 
	
	public void changeUserStateY(String userId) throws SQLException {
		SqlMapperUtil.getSqlMapper().update("changeUserStateY", userId);
	}
	
	public void changeUserStateN(String userId) throws SQLException {
		SqlMapperUtil.getSqlMapper().update("changeUserStateN", userId);
	}
}
