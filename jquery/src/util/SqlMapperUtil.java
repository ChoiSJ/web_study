package util;

import java.io.IOException;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlMapperUtil {
	
	private static SqlMapClient sqlMapper;
	
	static{
		try {
			
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(Resources.getResourceAsReader("config/SqlMapConfig.xml"));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
}
