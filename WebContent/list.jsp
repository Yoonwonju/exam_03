<%@page import="java.text.SimpleDateFormat"%>
<%@page import="exam_03.dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="exam_03.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDao boardDao = BoardDao.getInstance();
	List<Board> list = boardDao.selectBoardByAll();
	int countBoard = boardDao.countBoard();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>

	<section>
		총 <%=countBoard %>개의 게시물이 있습니다.
		<table border="1">
			<colgroup>
				<col width="10%"><col width="20%"><col width="50%"><col width="20%">
			</colgroup>
			<thead>
				<tr>
					<td>번호 </td>
					<td>작성자 </td>
					<td>제목 </td>
					<td>작성일 </td>
				</tr>
			</thead>
			<tbody>
			<% for(Board board : list){ %>
			<tr>
				<td><%=board.getIdx() %> </td>
				<td><%=board.getWriter() %> </td>
				<td><a href="/exam_03/index.jsp?pp=getBoard&idx=<%=board.getIdx()%>"><%=board.getSubject() %></a></td>
				<td><%=sdf.format(board.getRegDate()) %> </td>
			</tr>
			<% } %>
			</tbody>
		</table>
		<button type="button" onclick="location='write.jsp'"> 작 성 </button>
		
		
	</section>