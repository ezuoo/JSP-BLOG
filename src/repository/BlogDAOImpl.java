package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import domain.Blog;

public class BlogDAOImpl extends DAOImpl implements BlogDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	@Override
	public int create(Blog blog) {
		int rows = 0;
		String sql = "insert into blog(title, content, blogger, reg_date_time, filepath) values(?, ?, ?, ?, ?)";
		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, blog.getTitle());
			pstmt.setString(2, blog.getContent());
			pstmt.setString(3, blog.getBlogger());			
			pstmt.setString(4, blog.getReg_date_time());
			pstmt.setString(5, blog.getFilepath());
			rows = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return rows;
	}

	@Override
	public Blog read(Blog blog) {
		Blog retBlog = null;
		conn = this.getConnection();
		
		String sql = "select * from blog where no='" + blog.getNo()  + "'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) { // 다음 record값을 접근	
				// rs : record 집합, rs.getString(1) : 현재 레코드의 첫번재 필드 값
				retBlog = new Blog();
				retBlog.setNo(rs.getInt(1)); // rs.getString("<field_name>"); 필드이름로도 가능
				retBlog.setTitle(rs.getString(2)); // 생성 시 필드 순서
				retBlog.setContent(rs.getString(3));
				retBlog.setFilepath(rs.getString(4));
				retBlog.setBlogger(rs.getString(5));;
				retBlog.setReg_date_time(rs.getString(6));

			}
		} catch (SQLException e) {			e.printStackTrace();		} 
		finally {			this.closeResources(conn, stmt, pstmt, rs);		}
		return retBlog;
	}

	@Override
	public List<Blog> readList(int index) {
		List<Blog> blogList = null;
		Blog retBlog = null;
		conn = this.getConnection();
		
		String sql = "select * from blog order by no desc limit " + index + ", 3";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			blogList = new ArrayList<Blog>();
			while(rs.next()) { // 다음 record값을 접근	
				retBlog = new Blog();
				retBlog.setNo(rs.getInt(1)); // rs.getString("<field_name>"); 필드이름로도 가능
				retBlog.setTitle(rs.getString(2)); // 생성 시 필드 순서
				retBlog.setContent(rs.getString(3));
				retBlog.setFilepath(rs.getString(4));
				retBlog.setBlogger(rs.getString(5));;
				retBlog.setReg_date_time(rs.getString(6));
				blogList.add(retBlog);
			}
		} catch (SQLException e) {			e.printStackTrace();		} 
		finally {			this.closeResources(conn, stmt, pstmt, rs);		}
		return blogList;
	}
	
	@Override
	public int cnt() {
		int row = 0;
		String sql = "SELECT COUNT(*) FROM blog";
		
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
	public int update(Blog blog) {
		int rows = 0;
		String sql = "update blog set title=?, content=?, filepath=?, reg_date_time=? where no=?";
		//TO_TIMESTAMP('2019-12-15 12:00:00.0', 'YYYY-MM-DD HH24:MI:SS.FF3')
		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, blog.getTitle());
			pstmt.setString(2, blog.getContent());
			pstmt.setString(3, blog.getFilepath());
			pstmt.setString(4, blog.getReg_date_time());
			pstmt.setLong(5, blog.getNo());
			rows = pstmt.executeUpdate();
			if(rows == 0)
				System.out.println(blog.getTitle() + "error : " + blog.getReg_date_time() + ":::" + blog.getNo());
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return rows;
	}

	@Override
	public int delete(Blog blog) {
		int rows = 0;
		String sql = "delete from blog where no=?";

		try {
			conn = this.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, blog.getNo());
			rows = pstmt.executeUpdate();
				
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return rows;
	}

}
