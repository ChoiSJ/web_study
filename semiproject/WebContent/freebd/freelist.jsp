<%@page import="util.NumberUtil" %>
<%@page import="vo.FreeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.FreeDAO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>자유게시판</title>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<!-- 게시판 시작 -->
<div class="container-fluid main-container" style="padding-left: 0; padding-right: 0;">		
	<div class="container">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div><h2><strong>자유게시판</strong></h2></div>
					<form class="form-inline" method="post" action="freelist.jsp">
						<div class="form-group" style="padding-top: 10px; width: 100%; text-align: center;">
						<select class="form-control" name="searchType">
						  	<option>제목</option>
						  	<option>내용</option>
						  	<option>작성자</option>
						  	<option>제목+내용</option>
						</select>
							<input type="text" class="form-control" name="searchValue" placeholder="검색어를 입력하세요" style="width: 76%;">
							<button type="submit" class="btn btn-primary" style="width: 76px;">검색</button>
						</div>
					</form>
				</div>
				<div class="panel-body">
					<table class="table table-hover">
						<colgroup>
							<col width="10%">
							<col width="">
							<col width="15%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
							</tr>
						</thead>
						<tbody>
	<%
		request.setCharacterEncoding("utf-8");
	
		// 검색할경우 값입력.
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
	
		//original
		final int ROWS_PER_PAGE = 10;
		
		FreeDAO freeDao = new FreeDAO();
		int totalRows=0, totalPages=0;
		
		// 요청한 페이지에 해당하는 일정 조회하기
		ArrayList<FreeVO> freeList = new ArrayList<FreeVO>();	
		
		// 페이지 번호 알아내기
		int pageNo = NumberUtil.StringToInt(request.getParameter("pno"), 1);
		// 조회시 구간시작값과 구간끝값 알아내기
		int beginIndex = (pageNo - 1) * ROWS_PER_PAGE + 1;
		int endIndex = pageNo * ROWS_PER_PAGE;
		if(searchType != null && searchValue != null){
			
			if("제목".equals(searchType)){
				// 총 게시글수 조회
				totalRows = freeDao.getSearchTitleRows(searchValue);
				// 총 페이지 갯수 계산하기
				totalPages = (int) Math.ceil((double)totalRows/ROWS_PER_PAGE);
				
				// 요청한 페이지에 해당하는 일정 조회하기
				freeList = freeDao.getListForPagingSerchByTitle(beginIndex, endIndex, searchValue);	
				
			} else if("내용".equals(searchType)){
				// 총 게시글수 조회
				totalRows = freeDao.getSearchContentRows(searchValue);
				// 총 페이지 갯수 계산하기
				totalPages = (int) Math.ceil((double)totalRows/ROWS_PER_PAGE);
				
				// 요청한 페이지에 해당하는 일정 조회하기
				freeList = freeDao.getListForPagingSerchByContent(beginIndex, endIndex, searchValue);	
				
			} else if("제목+내용".equals(searchType)){
				// 총 게시글수 조회
				totalRows = freeDao.getSearchTitleNContentRows(searchValue);
				// 총 페이지 갯수 계산하기
				totalPages = (int) Math.ceil((double)totalRows/ROWS_PER_PAGE);
				
				// 요청한 페이지에 해당하는 일정 조회하기
				freeList = freeDao.getListForPagingSerchByTitleNContent(beginIndex, endIndex, searchValue);	
				
			} else if("작성자".equals(searchType)){
				// 총 게시글수 조회
				totalRows = freeDao.getSearchWriterRows(searchValue);
				// 총 페이지 갯수 계산하기
				totalPages = (int) Math.ceil((double)totalRows/ROWS_PER_PAGE);
				
				// 요청한 페이지에 해당하는 일정 조회하기
				freeList = freeDao.getListForPagingSerchByWriter(beginIndex, endIndex, searchValue);	
				
			}
		} else {
		 
			// 총 게시글수 조회
			totalRows = freeDao.getTotalRows();
			// 총 페이지 갯수 계산하기
			totalPages = (int) Math.ceil((double)totalRows/ROWS_PER_PAGE);
			
			// 요청한 페이지에 해당하는 일정 조회하기
			freeList = freeDao.getListForPaging(beginIndex, endIndex);	
		
		}
		
		for (FreeVO free : freeList) {
	%>
			<tr>
				<td><%=free.getNo() %></td>
				<td><a href="detail.jsp?tno=<%=free.getNo() %>&pno=<%=pageNo%>"><span style="color: black;"><strong><%=free.getTitle() %></strong></span></a></td>
				<td><%=free.getWriter() %></td>
				<td><%=free.getRegdate() %></td>
				<td><%=free.getCount() %></td>
			</tr>
	<%
		}
	%>
						</tbody>
					</table>
					<div class="text-center">
						<ul class="pagination pagination-sm">
						
						<% for (int index=1; index<=totalPages; index++) { %>
							
							<%
							if (index == pageNo) {
							%>
								<li class="active"><a href="freelist.jsp?pno=<%=index%>"><%=index %></a></li>
							<%	
							} else {
							%>
								<li><a href="freelist.jsp?pno=<%=index%>"><%=index %></a></li>
							<%	
							}
							%>
						
						<%} %>
						
						</ul>
					</div>
				</div>
				<div class="panel-footer text-right">
					<a href="registerform.jsp" class="btn btn-default">글쓰기</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 게시판 끝 -->
	<br>
	<%@ include file="../common/footer.jsp"%>
</div>
	

</body>
</html>