<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDao.getInstance().delete(num);
	
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/board/list.jsp");
%>
