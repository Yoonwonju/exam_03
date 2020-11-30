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
import exam_03.dto.Board;

public class BoardDao {
	private static final BoardDao instance = new BoardDao();

	private BoardDao() {
		super();
	}

	public static BoardDao getInstance() {
		return instance;
	}
	
	public List<Board> selectBoardByAll(){
		String sql = "select idx, writer, subject, content, regDate from board_tbl order by regDate desc";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			if(rs.next()) {
				List<Board> list = new ArrayList<Board>();
				do {
					list.add(getBoard(rs));
				}while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Board getBoard(ResultSet rs) throws SQLException {
		int idx = rs.getInt("idx");
		String writer = rs.getString("writer");
		String subject = rs.getString("subject");
		String content = rs.getString("content");
		Timestamp regDate = rs.getTimestamp("regdate");
		
		return new Board(idx, writer, subject, content, regDate);
	}
	
	public Board selectBoardByNo(int idx) {
		String sql = "select idx, writer, subject, content, regDate from BOARD_TBL where idx = ?";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, idx);
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next())
					return getBoard(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int insertBoard(Board board) {
		String sql = "insert into BOARD_TBL \r\n" + 
				"values(?, ?, ?, ?, ?)";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, board.getIdx());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			pstmt.setTimestamp(5, new Timestamp(new Date().getTime()));
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int updateBoard(Board board) {
		String sql = "update BOARD_TBL\r\n" + 
				"   set writer=?, subject=?, content=?\r\n" + 
				" where idx=?";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, board.getIdx());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int deleteBoard(Board board) {
		String sql = "delete from BOARD_TBL where idx=?";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, board.getIdx());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int countBoard() {
		String sql = "select count(*) from board_tbl";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}
