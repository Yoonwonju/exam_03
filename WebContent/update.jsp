<%@page import="exam_03.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BoardDao boardDao = BoardDao.getInstance();
%>

	<section>
		<h2>게시물 작성</h2>
		
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
				<td> <input type="text" name="content" required> </td>
			</tr>
		</table>
		<button type="submit" onclick="location='list.jsp'">취 소</button>
		<button type="submit" onclick="location='list.jsp'">완 료</button>
	</section>