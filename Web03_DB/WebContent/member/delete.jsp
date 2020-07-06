<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int num = Integer.parseInt(request.getParameter("num"));
	MemberDao dao = MemberDao.getInstance();
	dao.delete(num);
	
	//응답하기
	//회원 목록보기 요청을 하도록 강요한다. (리다이렉트 이동 시키기)
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/member/list.jsp");  //context path를 직접 작성하지 말것. 왜냐하면 나중에 context path가 변경되거나 제거될 수 있기 때문에
	
%>