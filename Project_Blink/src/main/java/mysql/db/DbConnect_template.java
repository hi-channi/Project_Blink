package mysql.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect_template {	// **** 수정할 부분 ****
	

	// driver
	static final String MYSQL_DRIVER="com.mysql.jdbc.Driver";
	// url
	static final String MYSQL_URL = "****DB_URL****";
	
	// 생성자
	public DbConnect_template() {	// **** 수정할 부분 ****
		try {
			Class.forName(MYSQL_DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("MYSQL 드라이버 오류(JAR 체크): "+e.getMessage());
			e.printStackTrace();
		}
	}
	
	// 계정 연결
	public Connection getConnection() {
		Connection conn = null;

		try {
			conn = DriverManager.getConnection(MYSQL_URL, "****USER_NAME****", "****PASSWORD****");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("MySQL DB서버 연결 오류: " + e.getMessage());
			e.printStackTrace();
		}

		return conn;
	}

	// Close 메소드 총 4개, 오버로딩 메소드
	public void dbClose(ResultSet rs, Statement stmt, Connection conn) {

		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {

		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void dbClose(Statement stmt, Connection conn) {

		try {
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void dbClose(PreparedStatement pstmt, Connection conn) {

		try {
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
