package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import domain.Member;

public interface DAO {
	Connection getConnection();
	void closeResources(Connection conn, Statement stmt, PreparedStatement pstmt, ResultSet rs);
}
