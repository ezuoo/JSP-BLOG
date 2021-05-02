package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAOImpl implements DAO {
	
	private Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection getConnection() {
		String url = "jdbc:mysql://localhost:3306/jsp?serverTimezone=UTC"; // DBMS URL과 포트 및 SID 
		String user = "root"; // 사용자 계정 : 현재는 system 계정임
		String password = "1234"; // 사용자 계정 암호

		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 드라이버 객체 로딩
			conn = DriverManager.getConnection(url, user, password); // 연결 객체 생성
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}			
		return conn;
	}
	
	
	public void closeResources(Connection conn, Statement stmt, PreparedStatement pstmt, ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
