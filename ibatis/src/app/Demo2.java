package app;

import java.io.Reader;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import vo.EmployeeVO;

public class Demo2 {
	
	public static void main(String[] args) throws Exception {
		
		Reader reader = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlMapClient sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		
		//EmployeeVO emp = new EmployeeVO();
		//emp.setDepartmentId(60);
		//emp.setSalary(5000);
		//emp.setJobId("SA_MAN");
		
		//List<EmployeeVO> employees = sqlMapper.queryForList("searchEmployees", emp);
		//System.out.println(employees);
		
		@SuppressWarnings("unchecked")
		List<EmployeeVO> employees1 = sqlMapper.queryForList("employeeSearchBySalary", 5000);
		
		for (EmployeeVO vo : employees1) {
			System.out.println(vo.getFirstName() + ", " + vo.getSalary() 
			+ ", " + vo.getDepartmentId() + ", " + vo.getJobId());
		}
		
		@SuppressWarnings("unchecked")
		List<EmployeeVO> employees2 = sqlMapper.queryForList("firstNameSearchByDepId", 100);
		
		for (EmployeeVO vo : employees2) {
			System.out.println(vo.getFirstName());
		}
		
		int salarySum = (int) sqlMapper.queryForObject("sumSalaryByDepno", 100);
		System.out.println(salarySum);
	
		int countEmp = (int) sqlMapper.queryForObject("countEmployeeByJobId", "IT_PROG");
		System.out.println(countEmp);
		
		EmployeeVO employee1 = (EmployeeVO) sqlMapper.queryForObject("searchEmployeeByEmpId", 100);
		System.out.println(employee1);
		
		EmployeeVO employee2 = (EmployeeVO) sqlMapper.queryForObject("searchEmployeeByFirstName", "Neena");
		System.out.println(employee2);
	}
}
