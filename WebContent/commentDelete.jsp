<%@page import="exam_03.dto.Comment"%>
<%@page import="java.util.List"%>
<%@page import="exam_03.dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	CommentDao commentDao = CommentDao.getInstance();
	List<Comment> list = commentDao.selectCommentByAll();
	int bidx = Integer.parseInt(request.getParameter("idx"));
	System.out.println("bidx --> " + bidx);
	
	Comment comment = commentDao.selectCommentByIdx(bidx);
	System.out.println("comment --> " + comment);
	
	int commRemove = commentDao.deleteComment(comment);
	System.out.println("commRemove --> " + commRemove);
	/* BoardDao boardDao = BoardDao.getInstance(); */
%>

<script>
	<%-- location.href="/exam_03/index.jsp?pp=getBoard&idx="+<%=board.getIdx() %>; --%>
	alert("commRemove 완료");
	location.href="/exam_03/index.jsp?pp=list";
</script>