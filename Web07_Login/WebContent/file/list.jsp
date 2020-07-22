<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .page-display a{
      text-decoration: none;
      color: #000;
   }

   .page-display ul li{
      float: left; /* 가로로 쌓이게*/
      list-style-type: none; /* disc 사라지게 */
      margin-right: 10px; /* 오른쪽 마진 */
   }
   
   .page-display ul li.active{
      /*li 요소이면서 active 클래스를 가지고 있는 요소*/
      text-decoration: underline;
      font-weight: bold;
   }
   
   .page-display ul li.active a{
      color: red;
   }
   
</style>
</head>
<body>
<%--글번호는 연속적이지 않고, 삭제되기도 하기 때문에 페이징처리에 사용하기엔 적합하지 않다. 따라서 정렬한 뒤 , rownum을 부여하고 
부여된 rownum으로 페이징 처리를 한다. --%>
<%
   //로그인 된 아이디 읽어오기.(로그인 하지 않으면 null이다.)
   String id = (String)session.getAttribute("id");
   
   //한 페이지에 나타낼 row 의 갯수
   final int PAGE_ROW_COUNT=5;
   //하단 디스플레이 페이지 갯수
   final int PAGE_DISPLAY_COUNT=5;
   
   
   //보여줄 페이지의 번호
   int pageNum=1;
   //보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.   
   String strPageNum=request.getParameter("pageNum");
   if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
      //페이지 번호를 설정한다.
      pageNum=Integer.parseInt(strPageNum);
   }
   
   //보여줄 페이지 데이터의 시작 ResultSet row 번호
   int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
   //보여줄 페이지 데이터의 끝 ResultSet row 번호
   int endRowNum=pageNum*PAGE_ROW_COUNT;
   
	/*
		검색 키워드에 관련된 처리============================
	*/
	String keyword=request.getParameter("keyword");
	if(keyword==null){//전달된 키워드가 없다면
		keyword=""; //빈 문자열을 넣어준다.
	}
	
	//인코딩된 키워드를 미리 만들어둔다.
	String encodedK = URLEncoder.encode(keyword);
	String condition = request.getParameter("condition");
	
	//검색 키워드와 startRowNum, endRownum 을 담을 FileDto 객체 생성
	FileDto dto = new FileDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//select 된 결과를 담을 List
	List<FileDto> list = null;
	//전체 row의 갯수를 담을 변수
	int totalRow=0;
	
	// 제목+내용 검색 / 제목검색 / 작성자 검색
	if(!keyword.equals("")){
	  if(condition.equals("title_filename")){
		   //검색 키워드를 FileDto 객체의 필드에 담는다.
		   dto.setTitle(keyword);
		   dto.setOrgFileName(keyword);
		   //검색 키워드에 맞는 파일 목록 중에서 pageNum 에 해당하는 목록 얻어오기
		   list=FileDao.getInstance().getListTF(dto);
		   //검색 키워드에 맞는 전체글의 갯수를 얻어온다.
		   totalRow=FileDao.getInstance().getCountTF(dto);
	  }else if(condition.equals("title")){
		   dto.setTitle(keyword);
		   list=FileDao.getInstance().getListT(dto);
		   totalRow=FileDao.getInstance().getCountT(dto);
	  }else if(condition.equals("writer")){
		   dto.setWriter(keyword);
		   list=FileDao.getInstance().getListW(dto);
		   totalRow=FileDao.getInstance().getCountW(dto);
	  }
	}else{//검색 키워드가 없으면 전체목록을 얻어온다.
		condition="";
		keyword="";
		list=FileDao.getInstance().getList(dto);
		//전체 row 의 갯수를 읽어온다.
		totalRow=FileDao.getInstance().getCount();
	}
   
   
   
   //전체 페이지의 갯수 구하기
   int totalPageCount=
         (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
  
   //시작 페이지 번호
   int startPageNum=
      1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;  
   // page_display_count가 pagenum-1보다 크면 계산결과가 0이므로 무조건 1페이지가 된다. (정수를 정수를 나누면 소수점이 잘리므로)
   
   //끝 페이지 번호 
   int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
   //끝 페이지 번호가 잘못된 값이라면 
   if(totalPageCount < endPageNum){
      endPageNum=totalPageCount; //보정해준다. 
   }
   
   
%>
   <div class="container">
      <a href="private/upload_form.jsp">파일 업로드</a>
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
            <%for(FileDto tmp:list){ %>
               <tr>
                  <td><%=tmp.getNum() %></td>
                  <td><%=tmp.getWriter() %></td>
                  <td><%=tmp.getTitle() %></td>
                  <td><a href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFileName()%></a></td>
                  <td><%=tmp.getFileSize() %></td>
                  <td><%=tmp.getRegdate() %></td>
                  <td>
                  <!-- id.equals를 할 경우엔 null포인트 익셉션을 발생시킬 위험이 있다.
                     따라서 순서에 유의해야 한다. tmp.getWriter()는 null이 될 리가 없으므로
                     안전하다.  -->
                     <%if(tmp.getWriter().equals(id)){%>
                        <a href="private/delete.jsp?num=<%=tmp.getNum()%>">삭제</a>
                     <%}%>
                  </td>
               </tr>
            <%} %>
         </tbody>
      </table>
      <div class="page-display">
         <ul>
         <%if(startPageNum != 1){ %>
         	<li><a href="list.jsp?pageNum=<%=startPageNum-1%>&condition=<%=condition %>&keyword=<%= encodedK%>">prev</a></li> <%-- 검색 keyword는 그대로 출력하지 말고 인코딩을 한 뒤에 출력한다.--%>
         <%} %>
            <%for(int i=startPageNum; i<=endPageNum; i++){ %>
               <%if(i==pageNum){ %>
                  <li class="active"><a href="list.jsp?pageNum=<%=i%>&condition=<%=condition %>&keyword=<%= encodedK%>"><%=i %></a></li>
               <%} else{%>
                  <li><a href="list.jsp?pageNum=<%=i%>&condition=<%=condition %>&keyword=<%= encodedK%>"><%=i %></a></li>
               <%} %>
            <%} %>
           <%if(endPageNum < totalPageCount){ %>
           		<li><a href="list.jsp?pageNum=<%=endPageNum+1 %>&condition=<%=condition %>&keyword=<%= encodedK%>">Next</a></li>
           <%} %>
         </ul>
         <%--&condition=<%=condition %>&keyword=<%= encodedK%> : 검색 기록이 그대로 유지되게 하는 파라미터 --%>
      </div>
		<hr style="clear: left;"/>
	  <form action="list.jsp" method="get">
	  	<label for="condition">검색조건</label>
	  	<select name="condition" id="condition">
	  		<option value="title_filename" <%if(condition.equals("title_filename")){ %>selected<%} %>>제목_파일명</option>
	  		<option value="title" <%if(condition.equals("title")){ %>selected<%} %>>제목</option>
	  		<option value="writer" <%if(condition.equals("writer")){ %>selected<%} %>>작성자</option>
	  	</select>
	  	<input type="text" name="keyword" placeholder="검색어..." value="<%=keyword %>"/>
	  	<button type="submit">검색</button>
	  </form>
   </div>
</body>
</html>