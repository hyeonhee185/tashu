package kr.or.ddit.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	//static 초기화 블럭, 클래스를 부르면 불러짐
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패!");
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		try {
			return DriverManager.getConnection(
					"jdbc:oracle:thin:@112.220.114.130:1521:xe",
					"team1_202104m","java");
		} catch (SQLException e) {
			System.out.println("오라클 DB 연결 실패");
			return null;
		}
	}
}
