package util;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlMapperUtil {
	
	private static SqlMapClient sqlMapper;
	
	static {
		try {
			Reader reader = Resources.getResourceAsReader("config/SqlMapConfig.xml");
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
}
