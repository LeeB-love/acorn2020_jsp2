<%@page import="java.io.File"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.파라미터로 전달되는 삭제할 파일의 번호를 읽어온다.
		int num = Integer.parseInt(request.getParameter("num"));
	//2.DB에서 해당 파일의 정보를 읽어온다.
		FileDto dto =FileDao.getInstance().getData(num);
	//로그인된 아이디와 글 작성자가 같을때만 삭제 되도록 한다.
		String id = (String)session.getAttribute("id");
		//만일 글 작성자가 로그인된 아이디와 같지 않으면
		if(!dto.getWriter().equals(id)){
			//.sendError(에러코드, 에러메세지);
			response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의 파일 지우기 있기없기?");
			return;
		}
	
	//3.파일 시스템에서 해당 파일을 삭제한다.
		String path = application.getRealPath("/upload")+File.separator+dto.getSaveFileName();
		File file = new File(path);
		file.delete();
	//4.DB에서 해당 파일의 정보를 삭제한다.
		boolean isDelete = FileDao.getInstance().delete(num);
		if(isDelete){
			String cPath = request.getContextPath();
			response.sendRedirect(cPath+"/file/list.jsp");
		}
%>