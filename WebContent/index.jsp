<%@page import="exam_03.dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="exam_03.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="include/top.jsp" />
<jsp:include page='${empty param.pp ? "list.jsp" : param.pp += ".jsp" }' />
<jsp:include page="include/footer.jsp" />