package app;

import java.io.Reader;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import vo.UserVO;

public class Demo {
	
	@SuppressWarnings("unchecked")
	public static void main(String[] args) throws Exception {
		
		// SqlMapConfig.xml 읽어오기
		Reader reader = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		// SqlMapClient 객체 만들기
		SqlMapClient sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		sqlMapper.delete("deleteAllUser");
		
		UserVO user = new UserVO();
		user.setId("hong2222");
		user.setPwd("2222");
		user.setName("홍진호");
		user.setPhone("010-2222-2222");
		user.setAddr("서울시 종로구");
		user.setPoint(222);
		user.setRegdate(new Date());
		sqlMapper.insert("addNewUser", user);
		
		UserVO user2 = new UserVO();
		user2.setId("im1111");
		user2.setPwd("1111");
		user2.setName("임요한");
		user2.setPhone("010-1111-1111");
		user2.setAddr("서울시 강남구");
		user2.setPoint(1111);
		user2.setRegdate(new Date());
		sqlMapper.insert("addNewUser", user2);
		
		String name = (String) sqlMapper.queryForObject("getUsernameById", "hong2222");
		System.out.println("조회된 이름:" + name);
		
		List<String> names = sqlMapper.queryForList("getAllUsername");
		System.out.println("모든 회원이름:" + names);
		
		int userCount = (int) sqlMapper.queryForObject("getUserCount");
		System.out.println("가입된 회원:" + userCount);
		
		UserVO selectedUser = (UserVO) sqlMapper.queryForObject("getUserById", "im1111");
		System.out.println("사용자 이름:" + selectedUser.getName());
		System.out.println("사용자 아이디:" + selectedUser.getId());
		System.out.println("사용자 비번:" + selectedUser.getPwd());
		
		List<UserVO> users = sqlMapper.queryForList("getAllUser");
		System.out.println("조회된 회원:" + users);
		
		HashMap<String, Object> map = (HashMap<String, Object>) sqlMapper.queryForObject("getUserByIdForMap", "hong2222");
		System.out.println("사용자 이름:" + map.get("USER_NAME"));
		System.out.println("사용자 아이디:" + map.get("USER_ID"));
		System.out.println("사용자 비번:" + map.get("USER_PWD"));
	}
}
