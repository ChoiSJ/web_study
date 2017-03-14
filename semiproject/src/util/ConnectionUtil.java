package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtil {

	// static 초기화블록
	// 프로그램의 일생동안 한번만 실행
	/**
	 * ConnectionUtil 클래스가 설계도로서 메모리에 로드될 때 자동으로 실행되는 코드 블록이다.
	 *  - Oracle의 jdbc드라이버를 JVM의 드라이버 레지스트리에 등록한다.
	 *   - Class.forName("클래스의 전체 경로");
	 *   	지정된 클래스를 JVM의 설계도 저장영역에 로드한다.
	 *   	아래 코드에서는 oracle의 jdbc드라이버를 메모리에 로드한다.
	 *   - oracle의 jdbc드라이버는 메모리에 로드되면 자동으로 JVM의 드라이버 레지스트리에 자신을 등록한다.
	 */
	static {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.exit(1); // 프로그램 종료
		}
	}
	
	/**
	 * 데이터베이스와 연결된 새로운 Connection 객체를 반환한다.
	 * @return Connection 객체
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
		String url = "jdbc:oracle:thin:@192.168.10.109:1521:xe";
		String user = "hr";
		String password = "zxcv1234";
		
		Connection con = DriverManager.getConnection(url, user, password);
		return con;
	}
}