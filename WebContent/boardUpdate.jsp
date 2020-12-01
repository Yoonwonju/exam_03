<%@page import="exam_03.dto.Board"%>
<%@page import="exam_03.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	BoardDao boardDao = BoardDao.getInstance();
	
	Board readyUpdate = boardDao.selectBoardByNo(idx);
	System.out.println("readyUpdate --> " + readyUpdate);
	
	int idxUp = Integer.parseInt(request.getParameter("idx"));
	String writer =  request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	Board board = new Board(idxUp, writer, subject, content);
	int updateBoard = boardDao.updateBoard(board);
	
	System.out.println("updateBoard --> " + updateBoard);
	
%>

	<section>
		<h2>게시물 수정</h2>
		
		<table border="1">
			<tr>
				<td> 작성자 </td>
				<td> <input type="text" name="writer" value="<%=readyUpdate.getWriter()%>" required> </td>
			</tr>
			<tr>
				<td> 제 목 </td>
				<td> <input type="text" name="subject" value="<%=readyUpdate.getSubject() %>" required> </td>
			</tr>
			<tr>
				<td> 내 용 </td>
				<td> <input type="text" name="content" value="<%=readyUpdate.getContent() %>" required> </td>
			</tr>
		</table>
		<button type="button" onclick="location='list.jsp'">취 소</button>
		<button type="button" onclick="/exam_03/index.jsp?pp=getBoard&idx=<%=idx %>">완 료</button>
	</section>

<%-- <script>
	location.href="/exam_03/index.jsp?pp=getBoard&idx=<%=idx %>";
</script> --%>