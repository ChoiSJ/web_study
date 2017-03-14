package dao;

import java.sql.SQLException;
import java.util.List;

import util.SqlMapperUtil;
import vo.UserVO;

public class UserDAO {
	
	public void addNewUser(UserVO user) throws SQLException {
		SqlMapperUtil.getSqlMapper().insert("addNewUser", user);
	}
	
	@SuppressWarnings("unchecked")
	public List<UserVO> getAllUser() throws SQLException {
		return SqlMapperUtil.getSqlMapper().queryForList("getAllUsers");
	}
}
