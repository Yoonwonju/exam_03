<%@page import="exam_03.dao.CommentDao"%>
<%@page import="exam_03.dto.Comment"%>
<%@page import="exam_03.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	BoardDao boardDao = BoardDao.getInstance();
	int idx = Integer.parseInt(request.getParameter("idx"));
	System.out.println("idx : " + idx);

	CommentDao commentDao = CommentDao.getInstance();
	String commentAdd = request.getParameter("commentAdd");
	
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	System.out.println("writer : " + writer);
	System.out.println("content : " + content);
	
	Comment comment = new Comment(idx, writer, content);
	int commAdd = commentDao.insertComment(comment);
	System.out.println("commAdd --> " + commAdd);

%>

<script>
	alert("commAdd 완료");
	location.href="/exam_03/index.jsp?pp=getBoard&idx="+<%=idx%>;
</script>