<%@page import="vo.ReviewVO"%>
<%@page import="dao.ReviewDAO"%>
<%@page import="vo.QnaVO"%>
<%@page import="dao.QnaDAO"%>
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
<title>EBS 공감</title>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%if(isLogined==false){response.sendRedirect("/account/login.jsp"); return;} %>
	<%
		request.setCharacterEncoding("utf-8");
		
		// 검색할경우 값입력.
		String searchType = request.getParameter("searchType");
		System.out.println(searchType);
	%>
	<!-- 게시판 시작 -->
<div class="container-fluid main-container" style="padding-left: 0; padding-right: 0;">		
	<div class="container">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div><h2><strong>내가 작성한 글</strong></h2></div>
					<form class="form-inline" method="post" action="mywords.jsp">
						<div class="form-group" style="padding-top: 10px;">
							<input type="hidden" class="form-control" name="searchType" id="boardName">
							<a onclick="location.href='mywords.jsp'"><button type="button" class="btn btn-<%if(searchType==null){%>primary<%} else {%>default<%}%>">자유게시판</button></a>
							<button type="submit" class="btn btn-<%if("review".equals(searchType)){%>primary<%} else {%>default<%}%>" onclick="reviewboard();">리뷰게시판</button>
							<button type="submit" class="btn btn-<%if("qna".equals(searchType)){%>primary<%} else {%>default<%}%>" onclick="qnaboard();">Q&amp;A게시판</button>
						</div>
					</form>
				</div>
				<div class="panel-body">
					<table class="table">
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
		//original
		final int ROWS_PER_PAGE = 10;
		
		FreeDAO freeDao = new FreeDAO();
		
		int totalRows=0, totalPages=0;
		
		// 페이지 번호 알아내기
		int pageNo = NumberUtil.StringToInt(request.getParameter("pno"), 1);
		// 조회시 구간시작값과 구간끝값 알아내기
		int beginIndex = (pageNo - 1) * ROWS_PER_PAGE + 1;
		int endIndex = pageNo * ROWS_PER_PAGE;
		
		if(searchType != null){
			
			if("qna".equals(searchType)){
				QnaDAO qnaDAO = new QnaDAO();
				ArrayList<QnaVO> freeList = new ArrayList<QnaVO>();	
				
				// 총 게시글수 조회
				totalRows = qnaDAO.getSearchWriterRows(user.getUserId());
				// 총 페이지 갯수 계산하기
				totalPages = (int) Math.ceil((double)totalRows/ROWS_PER_PAGE);
				
				// 요청한 페이지에 해당하는 일정 조회하기
				freeList = qnaDAO.getListForPagingSerchByWriter(beginIndex, endIndex, user.getUserId());	
				
				for (QnaVO free : freeList) {
					%>
							<tr>
								<td><%=free.getNo() %></td>
								<td><a href="../qnabd/detail.jsp?tno=<%=free.getNo() %>&pno=<%=pageNo%>"><%=free.getTitle() %></a></td>
								<td><%=free.getWriter() %></td>
								<td><%=free.getRegdate() %></td>
								<td><%=free.getCount() %></td>
							</tr>
					<%
				}
			} else if("review".equals(searchType)){

				ReviewVO rvos = new ReviewVO();
				rvos.setTitle("userid");
				rvos.setContent(user.getUserId());
				
				ReviewDAO rDAO = new ReviewDAO();
				ArrayList<ReviewVO> freeList = new ArrayList<ReviewVO>();	
				
				// 총 게시글수 조회
				totalRows = rDAO.getSearchTotalRowsWriter("userid", user.getUserId());
				// 총 페이지 갯수 계산하기
				totalPages = (int) Math.ceil((double)totalRows/ROWS_PER_PAGE);
				
				// 요청한 페이지에 해당하는 일정 조회하기
				freeList = rDAO.searchReviewWriter(rvos, beginIndex, endIndex);	
				
				for (ReviewVO free : freeList) {
					%>
							<tr>
								<td><%=free.getNo() %></td>
								<td><a href="../reviewbd/reviewDetail.jsp?no=<%=free.getNo() %>&pno=<%=pageNo%>"><%=free.getTitle() %></a></td>
								<td><%=free.getUserId() %></td>
								<td><%=free.getRegdate() %></td>
								<td><%=free.getScore() %></td>
							</tr>
					<%
				}
			}
		} else {
			
			// 요청한 페이지에 해당하는 일정 조회하기
			ArrayList<FreeVO> freeList = new ArrayList<FreeVO>();	
		 
			// 총 게시글수 조회
			totalRows = freeDao.getSearchWriterRows(user.getUserId());
			// 총 페이지 갯수 계산하기
			totalPages = (int) Math.ceil((double)totalRows/ROWS_PER_PAGE);
			
			// 요청한 페이지에 해당하는 일정 조회하기
			freeList = freeDao.getListForPagingSerchByWriter(beginIndex, endIndex, user.getUserId());	
			
		
			for (FreeVO free : freeList) {
		%>
				<tr>
					<td><%=free.getNo() %></td>
					<td><a href="../freebd/detail.jsp?tno=<%=free.getNo() %>&pno=<%=pageNo%>"><%=free.getTitle() %></a></td>
					<td><%=free.getWriter() %></td>
					<td><%=free.getRegdate() %></td>
					<td><%=free.getCount() %></td>
				</tr>
		<%
			}
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
								<li class="active"><a href="mywords.jsp?pno=<%=index%><%if(searchType!=null){%>&searchType=<%=searchType%><%}%>"><%=index %></a></li>
							<%	
							} else {
							%>
								<li><a href="mywords.jsp?pno=<%=index%><%if(searchType!=null){%>&searchType=<%=searchType%><%}%>"><%=index %></a></li>
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
<script type="text/javascript">
	function qnaboard(){
		var boardName = document.getElementById("boardName");
		boardName.value = "qna";
	}
	function reviewboard(){
		var boardName = document.getElementById("boardName");
		boardName.value = "review";
	}
</script>
</html>