<%@page import="util.NumberUtil" %>
<%@page import="vo.QnaVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.QnaDAO"%>
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
<style type="text/css">
.Sucessicon {
	font-weight:bold;
	text-decoration:none;
	font-family:Arial;
	box-shadow:inset #ffffff 0px 2px 0px -1px,#d2d3d4 0px 1px 3px;
	o-box-shadow:inset #ffffff 0px 2px 0px -1px,#d2d3d4 0px 1px 3px;
	-moz-box-shadow:inset #ffffff 0px 2px 0px -1px,#d2d3d4 0px 1px 3px;
	-webkit-box-shadow:inset #ffffff 0px 2px 0px -1px,#d2d3d4 0px 1px 3px;
	background:#bfecff;
	background:-o-linear-gradient(90deg, #bfecff, #d4f2ff);
	background:-moz-linear-gradient( center top, #bfecff 5%, #d4f2ff 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #bfecff), color-stop(1, #d4f2ff) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#bfecff', endColorstr='#d4f2ff');
	background:-webkit-linear-gradient(#bfecff, #d4f2ff);
	background:-ms-linear-gradient(#bfecff, #d4f2ff);
	background:linear-gradient(#bfecff, #d4f2ff);
	text-indent:0px;
	line-height:0px;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:12px;
	color:#395863;
	width:50px;
	height:0px;
	padding:10px;
	text-shadow:#ade6ff 0px 1px 0px;
	border-color:#59a9c6;
	border-width:1px;
	border-style:solid;
}

.Sucessicon:active {
	box-shadow:inset #ffffff 0px 2px 0px -1px,#d2d3d4 0px 0 3px;
	o-box-shadow:inset #ffffff 0px 2px 0px -1px,#d2d3d4 0px 0 3px;
	-moz-box-shadow:inset #ffffff 0px 2px 0px -1px,#d2d3d4 0px 0 3px;
	-webkit-box-shadow:inset #ffffff 0px 2px 0px -1px,#d2d3d4 0px 0 3px;
	position:relative;
	top:1px
}

.Sucessicon:hover {
	background:#d4f2ff;
	background:-o-linear-gradient(90deg, #d4f2ff, #bfecff);
	background:-moz-linear-gradient( center top, #d4f2ff 5%, #bfecff 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #d4f2ff), color-stop(1, #bfecff) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#d4f2ff', endColorstr='#bfecff');
	background:-webkit-linear-gradient(#d4f2ff, #bfecff);
	background:-ms-linear-gradient(#d4f2ff, #bfecff);
	background:linear-gradient(#d4f2ff, #bfecff);
}
</style>
<title>Q&amp;A</title>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<!-- 게시판 시작 -->
<div class="container-fluid main-container" style="padding-left: 0; padding-right: 0;">		
	<div class="container">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div><h2><strong>Q&amp;A</strong></h2></div>
					<form class="form-inline" method="post" action="qnalist.jsp">
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
		
		QnaDAO QnaDAO = new QnaDAO();
		int totalRows=0, totalPages=0;
		
		// 요청한 페이지에 해당하는 일정 조회하기
		ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();	
		
		// 페이지 번호 알아내기
		int pageNo = NumberUtil.StringToInt(request.getParameter("pno"), 1);
		// 조회시 구간시작값과 구간끝값 알아내기
		int beginIndex = (pageNo - 1) * ROWS_PER_PAGE + 1;
		int endIndex = pageNo * ROWS_PER_PAGE;
		if(searchType != null && searchValue != null){
			
			if("제목".equals(searchType)){
				// 총 게시글수 조회
				totalRows = QnaDAO.getSearchTitleRows(searchValue);
				// 총 페이지 갯수 계산하기
				totalPages = (int) Math.ceil((double)totalRows/ROWS_PER_PAGE);
				
				// 요청한 페이지에 해당하는 일정 조회하기
				qnaList = QnaDAO.getListForPagingSerchByTitle(beginIndex, endIndex, searchValue);	
				
			} else if("내용".equals(searchType)){
				// 총 게시글수 조회
				totalRows = QnaDAO.getSearchContentRows(searchValue);
				// 총 페이지 갯수 계산하기
				totalPages = (int) Math.ceil((double)totalRows/ROWS_PER_PAGE);
				
				// 요청한 페이지에 해당하는 일정 조회하기
				qnaList = QnaDAO.getListForPagingSerchByContent(beginIndex, endIndex, searchValue);	
				
			} else if("제목+내용".equals(searchType)){
				// 총 게시글수 조회
				totalRows = QnaDAO.getSearchTitleNContentRows(searchValue);
				// 총 페이지 갯수 계산하기
				totalPages = (int) Math.ceil((double)totalRows/ROWS_PER_PAGE);
				
				// 요청한 페이지에 해당하는 일정 조회하기
				qnaList = QnaDAO.getListForPagingSerchByTitleNContent(beginIndex, endIndex, searchValue);	
				
			} else if("작성자".equals(searchType)){
				// 총 게시글수 조회
				totalRows = QnaDAO.getSearchWriterRows(searchValue);
				// 총 페이지 갯수 계산하기
				totalPages = (int) Math.ceil((double)totalRows/ROWS_PER_PAGE);
				
				// 요청한 페이지에 해당하는 일정 조회하기
				qnaList = QnaDAO.getListForPagingSerchByWriter(beginIndex, endIndex, searchValue);	
				
			}
		} else {
		 
			// 총 게시글수 조회
			totalRows = QnaDAO.getTotalRows();
			// 총 페이지 갯수 계산하기
			totalPages = (int) Math.ceil((double)totalRows/ROWS_PER_PAGE);
			
			// 요청한 페이지에 해당하는 일정 조회하기
			qnaList = QnaDAO.getListForPaging(beginIndex, endIndex);	
		
		}
		
		for (QnaVO qna : qnaList) {
	%>
			<tr>
				<td><%=qna.getNo() %></td>
				<td>
				<a href="detail.jsp?tno=<%=qna.getNo() %>&pno=<%=pageNo%>">
				<span style="color: black;"><strong><%=qna.getTitle() %></strong></span>
				</a>
				<%if(QnaDAO.getQnaReply(qna.getNo()) != null){ %>
					&nbsp;<span class='Sucessicon'>완료</span>
				<%} %>
				</td>
				<td><%=qna.getWriter() %></td>
				<td><%=qna.getRegdate() %></td>
				<td><%=qna.getCount() %></td>
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
								<li class="active"><a href="qnalist.jsp?pno=<%=index%>"><%=index %></a></li>
							<%	
							} else {
							%>
								<li><a href="qnalist.jsp?pno=<%=index%>"><%=index %></a></li>
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
	<!-- footer -->
	<%@ include file="../common/footer.jsp"%> 
</div>
</body>
</html>