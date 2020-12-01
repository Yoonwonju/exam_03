<%@page import="exam_03.dto.Board"%>
<%@page import="exam_03.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	BoardDao boardDao = BoardDao.getInstance();
	int idx = Integer.parseInt(request.getParameter("idx"));
	Board board = boardDao.selectBoardByNo(idx);
	int boarRemove = boardDao.deleteBoard(board);
%>

<script>
	alert("boarRemove 완료");
	location.href="/exam_03/index.jsp?pp=list";
</script>