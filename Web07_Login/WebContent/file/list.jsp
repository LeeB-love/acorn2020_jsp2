<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<FileDto> list = FileDao.getInstance().getList();

	//로그인 된 아이디 읽어오기 (로그인을 하지 않으면 null)
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
</head>
<body>
<div class="container">
	<h1>파일 목록입니다.</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>파일명</th>
				<th>파일크기</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<% for(FileDto tmp:list){%>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><%=tmp.getTitle() %></td>
					<td><a href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFileName()%></a></td>
					<td><%=tmp.getFileSize() %></td>
					<td><%=tmp.getRegdate() %></td>
					<td><%--
							조건부로 출력해야한다 : session id와 작성자가 일치하는 경우 
							로그인을 하지 않을 경우, id가 null일 수도 있다.
							null.equals() 는 오류를 불러올 수 있으므로, null이 없는 tmp.getWriter()을 사용해서
							비교해야함
						--%>
						<%if(tmp.getWriter().equals(id)){ %>
							<a href="private/delete.jsp?num=<%= tmp.getNum()%>">삭제</a>
						<%} %>
					</td>
				</tr>
			<% }%>
		</tbody>
	</table>
	<a href="private/upload_form.jsp">파일업로드</a>
</div>
</body>
</html>