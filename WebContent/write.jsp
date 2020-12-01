<%@page import="exam_03.dto.Board"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="exam_03.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	BoardDao boardDao = BoardDao.getInstance();
	
	/* String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	Board board = new Board(writer, subject, content);
	
	BoardDao.getInstance().insertBoard(board); */
	
%>

	<section>
		<h2>게시물 작성</h2>
		<form action="boardAdd.jsp" method="post" name="boardAdd" id="">
		<table border="1">
			<tr>
				<td> 작성자 </td>
				<td> <input type="text" name="writer" required> </td>
			</tr>
			<tr>
				<td> 제 목 </td>
				<td> <input type="text" name="subject" required> </td>
			</tr>
			<tr>
				<td> 내 용 </td>
				<td> <textarea name="content" rows="5" cols="30" required></textarea> </td>
			</tr>
		</table>
		<button type="submit" onclick="location='list.jsp'">목 록</button>
		<button type="submit" onclick="location='list.jsp'">완 료</button>
		</form>
	</section>