package exam_03.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import exam_03.ds.JdbcUtill;
import exam_03.dto.Comment;

public class CommentDao {
	private static CommentDao instance = new CommentDao();

	private CommentDao() {
		super();
	}

	public static CommentDao getInstance() {
		return instance;
	}

	public List<Comment> selectCommentByAll() {
		String sql = "select idx, bidx, writer, content, regdate from comment_tbl";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			if(rs.next()) {
				List<Comment> list = new ArrayList<Comment>();
				do{
					list.add(getComment(rs));
				}while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Comment getComment(ResultSet rs) throws SQLException {
		int idx = rs.getInt("idx");
		int bidx = rs.getInt("bidx");
		String writer = rs.getString("writer");
		String content = rs.getString("content");
		Timestamp regDate = rs.getTimestamp("regdate");

		return new Comment(idx, bidx, writer, content, regDate);
	}

	public List<Comment> selectCommentByBidx(int bidx) {
		String sql = "select idx, bidx, writer, content, regdate from comment_tbl where bidx=?";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, bidx);
				try(ResultSet rs = pstmt.executeQuery();) {
					if(rs.next()) {
						List<Comment> list = new ArrayList<Comment>();
						do {
							list.add(getComment(rs));
					}while(rs.next());
					return list;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Comment selectCommentByIdx(int idx) {
		String sql = "select idx, bidx, writer, content, regdate from comment_tbl where idx=?";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, idx);
				try(ResultSet rs = pstmt.executeQuery();){
					if(rs.next()) {
						return getComment(rs);
					}
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int insertComment(Comment comment) {
		String sql = "insert into comment_tbl \r\n" + 
				"values(?, ?, ?, ?, ?)";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, comment.getIdx());
			pstmt.setInt(2, comment.getBidx());
			pstmt.setString(3, comment.getWriter());
			pstmt.setString(4, comment.getContent());
			pstmt.setTimestamp(5, new Timestamp(new Date().getTime()));
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int deleteComment(Comment comment) {
		String sql = "delete from comment_tbl where idx=?";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, comment.getIdx());
			
			pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;	
	}
	
}
