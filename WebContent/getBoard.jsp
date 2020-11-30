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
%>

	<section>
		<table border="1">
			<h2> 게시물 조회 </h2>
				<td> 제목 : <%=board.getSubject() %> </td>
			<tr> 
				<td> 작성자 : <%=board.getWriter() %> </td>
				<td> 작성일 : <%=regDate %> </td>
			</tr>
			<tr> <%=board.getContent() %> </tr>
		</table>
		<table border="1">
			<tr> 댓글 조회 </tr>
			<%
				if(list == null){
					out.println(" ");	
				}else{
					for(Comment cList : list){
			%>
				<tr>
					<td> <%=cList.getWriter() %> / <%=cList.getContent() %> / <%=cList.getRegDate() %>
				 			/  <a>삭제</a>
				 	</td>
			 	</tr>
				
			<%			
					}
				}
			%>
		</table>
		<table border="1">
			<tr>댓글작성 </tr>
			<tr>
				<td> 작성자 : </td>
				<td><input type="text"> </td>
				<td> 댓글내용 : </td>
				<td><input type="text"> </td>
				<td><button type="submit"> 작성 완료 </button> </td>
			</tr>
		</table>
		<button type="button" onclick="history.back();"> 목 록 </button>
		<button type="button" onclick="location='update.jsp?idx=<%=idx %>'"> 수 정 </button>
		<button type="button" onclick="location='list.jsp'"> 삭 제 </button>
		
	</section>