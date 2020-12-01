<%@page import="exam_03.dto.Board"%>
<%@page import="exam_03.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");	
	
	BoardDao boardDao = BoardDao.getInstance();
	String boardAdd = request.getParameter("boardAdd");
	
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	System.out.println("writer : " + writer);
	System.out.println("subject : " + subject);
	System.out.println("content : " + content);
	
	Board board = new Board(writer, subject, content);
	int boarAdd = boardDao.insertBoard(board);
	System.out.println("boarAdd --> " + boarAdd);

%>

<script>
	alert("boardAdd 완료");
	location.href="/exam_03/index.jsp?pp=list";
</script>