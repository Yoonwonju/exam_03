package exam_03;

import java.sql.Connection;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import exam_03.dao.BoardDao;
import exam_03.dao.CommentDao;
import exam_03.ds.JdbcUtill;
import exam_03.dto.Board;
import exam_03.dto.Comment;

public class TestMain {

	public static void main(String[] args) {
		BoardDao boardDao = BoardDao.getInstance();
		CommentDao commentDao = CommentDao.getInstance();
		
		Connection con = JdbcUtill.getConnection();
		System.out.println(con);

//		List<Board> blist = boardDao.selectBoardByAll();
//		for(Board b : blist) {
//			System.out.println(b);
//		}
//		
//		Board findBoard = boardDao.selectBoardByNo(2);
//		System.out.println(findBoard);
//		
//		Board newBoard = new Board();
//		newBoard.setWriter("인서트");
//		newBoard.setSubject("제목이구요");
//		newBoard.setContent("내용입니다");
//		newBoard.setRegDate(new Timestamp(new Date().getTime()));
//		int res = boardDao.insertBoard(newBoard);
//		
//		Board modifyBoard = boardDao.selectBoardByNo(0);
//		modifyBoard.setWriter("수정");
//		modifyBoard.setSubject("제목수정했고");
//		modifyBoard.setContent("내용도수정했다");
//		int res2 = boardDao.updateBoard(modifyBoard);
//		
//		Board findBoard2 = boardDao.selectBoardByNo(0);
//		System.out.println(findBoard2);
//		
//		Board removeBoard = boardDao.selectBoardByNo(0);
//		int res3 = boardDao.deleteBoard(removeBoard);
//		
//		List<Board> blist2 = boardDao.selectBoardByAll();
//		for(Board b2 : blist2) {
//			System.out.println(b2);
//		}
		
		int numberBoardLists = boardDao.countBoard();
		System.out.println(numberBoardLists);
		
//		*** Comment
//		List<Comment> clist = commentDao.selectCommentByAll();
//		for(Comment c : clist) {
//			System.out.println(c);
//		}
//		
//		List<Comment> findComment = commentDao.selectCommentByBidx(3);
//		for(Comment c2 : findComment) {
//			System.out.println(c2);
//		}
//		
//		Comment newComment = new Comment();
//		newComment.setBidx(3);
//		newComment.setWriter("뉴코멘트");
//		newComment.setContent("새로운내용추가");
//		newComment.setRegDate(new Timestamp(new Date().getTime()));
//		int res = commentDao.insertComment(newComment);
//		
//		List<Comment> clist2 = commentDao.selectCommentByAll();
//		for(Comment c2 : clist2) {
//			System.out.println(c2);
//		}
//		
//		Comment removeComment = commentDao.selectCommentByIdx(0);
//		int res4 = commentDao.deleteComment(removeComment);
//		
//		List<Comment> clist3 = commentDao.selectCommentByAll();
//		for(Comment c3 : clist3) {
//			System.out.println(c3);
//		}
		
		
	}

}
