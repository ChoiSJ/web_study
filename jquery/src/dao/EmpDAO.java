package dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import util.SqlMapperUtil;
import vo.Dept;
import vo.Emp;

public class EmpDAO {
	// 모든 부서 정보를 조회하는 SQL
	public List<Dept> getAllDepts() throws SQLException{
		SqlMapClient sqlmap = SqlMapperUtil.getSqlMapper();
		return sqlmap.queryForList("getAllDept");
	} 
	
	// 부서아이디에 해당하는 사원들을 조회하는 SQL
	public List<Emp> getEmps(int id) throws SQLException{
		SqlMapClient sqlmap = SqlMapperUtil.getSqlMapper();
		return sqlmap.queryForList("getEmployeeByDeptId", id);
	}
	
	// 사원 아이디에 해당하는 사원상세정보를 조히하는 SQL
	public Emp getEmp(int id) throws SQLException{
		SqlMapClient sqlmap = SqlMapperUtil.getSqlMapper();
		return (Emp) sqlmap.queryForObject("getEmployeeById", id);
	}
}
