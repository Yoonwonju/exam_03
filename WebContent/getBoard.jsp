<%@page import="java.util.List"%>
<%@page import="exam_03.dto.Comment"%>
<%@page import="exam_03.dao.CommentDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="exam_03.dto.Board"%>
<%@page import="exam_03.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BoardDao boardDao = BoardDao.getInstance();
	int idx = Integer.parseInt(request.getParameter("idx"));
	Board board = boardDao.selectBoardByNo(idx);
	
	CommentDao commentDao = CommentDao.getInstance();
	/* int bidx = Integer.parseInt(request.getParameter("bidx")); */
	List<Comment> list = commentDao.selectCommentByBidx(idx);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	String regDate = sdf.format(board.getRegDate());
	
	Comment comment = commentDao.selectCommentByIdx(idx);
	
	/* 업데이트  */
	Board selectBoard = boardDao.selectBoardByNo(idx);
	System.out.println("selectBoard --> " + selectBoard);
	
%>

	<section>
		<table border="1">
			<h2> 게시물 조회 </h2>
			<tr>
				<td>제목 : <%=board.getSubject() %></td>
			</tr>
			<tr> 
				<td> 작성자 : <%=board.getWriter() %> </td>
				<td> 작성일 : <%=regDate %> </td>
			</tr>
			<tr>
				<td><%=board.getContent() %> </td> 
			</tr>
		</table>
		<table border="1">
			<tr>
				<td> 댓글 조회 </td>
			</tr>
			<%
				if(list == null){
					out.print(" ");	
				}else{
					for(Comment cList : list){
			%>
				<tr>
					<td> <%=cList.getWriter() %> / <%=cList.getContent() %> / <%=cList.getRegDate() %>
						/ <a href="commentDelete.jsp?idx=<%=idx %>" style="text-decoration: none">삭제</a>
				 	</td>
			 	</tr>
				
			<%			
					}
				}
			%>
		</table>
		<table border="1">
		    	<form action="commentAdd.jsp?idx=<%=idx %>" method="post">
		    		<input type="hidden" name="commentAdd" value="">
					<tr><td>댓글작성 <td></tr>
					<tr>
						<td>작성자 : <input type="text" name="writer" id="writer"> </td>
						<td>댓글내용 : <input type="text" name="content" id="content"> </td>
						<td><button type="submit"> 작성 완료 </button> </td>
					<!-- form 內 button type=submit -->
					</tr>
				</form>
					<!-- form 外 button type=button onclick으로 js 실행 추가 -->
		</table>
		<button type="button" onclick="location='list.jsp'"> 목 록 </button>
		<button type="button" onclick="location='boardUpdate.jsp?idx=<%=selectBoard.getIdx() %>'"> 수 정 </button>
		<button type="button" onclick="location='boardDelete.jsp?idx=<%=idx %>'"> 삭 제 </button>
		
	</section>