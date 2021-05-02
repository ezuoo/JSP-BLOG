package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import domain.Blog;
import domain.Member;

public class MemberDAOImpl extends DAOImpl implements MemberDAO {
	
	private Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public int create(Member member) {
		int rows = 0;
		String sql = "insert into member(name, email, pw, phone, address,regdate) values(?, ?, ?, ?, ?, ?)";
		
		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getPw());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getRegdate());
			rows = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return rows;
	}

	@Override
	public Member read(Member member) {
		Member retMember = null;
		conn = this.getConnection();
		
		String sql = "select * from member where email='" + member.getEmail()  + "'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			retMember= new Member();
			if(rs.next()) {
				retMember.setEmail(rs.getString(2));
				retMember.setPw(rs.getString(3)); // 생성 시 필드 순서
				retMember.setName(rs.getString(4));
				retMember.setPhone(rs.getString(5));
				retMember.setAddress(rs.getString(6));;
				retMember.setRegdate(rs.getString(7));;				
			}
		} catch (SQLException e) {	
			e.printStackTrace();		
		} 
		finally {			this.closeResources(conn, stmt, pstmt, rs);		}
		return retMember;
	}
	
	@Override
	public List<Member> readList() {
		List<Member> memberList = null;
		Member retMember = null;
		conn = this.getConnection();
		
		String sql = "select * from member order by no desc";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			memberList = new ArrayList<Member>();
			while(rs.next()) { // 다음 record값을 접근	
				retMember = new Member();
				retMember.setNo(rs.getInt(1)); 
				retMember.setEmail(rs.getString(2)); // 생성 시 필드 순서
				retMember.setName(rs.getString(4));
				retMember.setPhone(rs.getString(5));
				retMember.setRegdate(rs.getString(7));
				memberList.add(retMember);
			}
		} catch (SQLException e) {			e.printStackTrace();		} 
		finally {			this.closeResources(conn, stmt, pstmt, rs);		}
		return memberList;
	}

	@Override
	public int login(Member member) {
		int row = 0;
		String sql = "SELECT COUNT(*) FROM member WHERE email = '" 
		+ member.getEmail() + "' AND pw = '" + member.getPw() + "';";
		
		try {
			conn = this.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) row = rs.getInt(1);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return row;
	}

	@Override
	public int update(Member member) {
		int rows = 0;
		String sql = "update member set name=?, pw=?, phone=?, address=?, regdate=? where email=?";
		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getRegdate());
			pstmt.setString(6, member.getEmail());
			rows = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return rows;
	}

	@Override
	public int delete(Member member) {
		int rows = 0;
		String sql = "delete from member where email=?";
		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			
			rows = pstmt.executeUpdate();
				
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return rows;
	}

}
