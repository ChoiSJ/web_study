<%@page import="vo.UserVO"%>
<%@page import="util.NumberUtil"%>
<%@page import="vo.noticeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.noticeDAO"%>
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
form {
	display: inline;
	margin:0;
}
</style>
<title>공지게시판 | 스페이스공감 - 교육의 중심 EBS</title>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
<div class="container-fluid main-container" style="padding-left: 0; padding-right: 0;">	
	<div class="container">
	<div class="col-md-12">
	<div class="panel panel-default">
			<div id="top-title" class="panel-heading">
				<div class="panel-heading">
					<h2><strong>공지사항</strong></h2>
					<form method="post" action="noticeList.jsp" name="search" class="form-inline">
					<div class="form-group" style="padding-top: 10px; width: 100%; text-align: center;">
						<select class="form-control" name="searchname">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" class="form-control" name="searchkey" placeholder="검색어 입력." style="width: 76%;" id="search_input"/>
						<button type="submit" class="btn btn-info" style="width: 76px;">검색</button>				
					</div>	
					</form>
				</div>
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
						<th class="text-center">번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<%
					request.setCharacterEncoding("utf-8");
					noticeDAO ndao = new noticeDAO();
					ArrayList<noticeVO>impList = new ArrayList<>();
					impList = ndao.getnoticelist();
					final int ROWS_PER_PAGE_IMP = 5;
					int imptotalrows = ndao.getImpTotalRows();
					int imptotalPages = (int) Math.ceil((double)imptotalrows/ROWS_PER_PAGE_IMP);
					int pageimpNo = NumberUtil.StringToInt(request.getParameter("pno"),1,imptotalPages);
					for(noticeVO impnlist : impList){
						String imps = "imp";
				%>
						<tr>
							<td style="text-align: center;"><span class="label label-danger">필독</span></td>
							<td><a href="noticedetail.jsp?no=<%=impnlist.getNo()%>&pno=<%=pageimpNo%>"><%=impnlist.getTitle() %></a></td>
							<td><%=impnlist.getRegdate() %></td>
							<td><%=impnlist.getCount() %></td>
						<tr>
				<%
					}
				%>
				<%
					String searchType = request.getParameter("searchname");
					String searchKeyword = request.getParameter("searchkey");
				if(searchType != null && searchKeyword != null && !searchKeyword.equals("")){
					System.out.println(searchKeyword);
					noticeVO nlistvo = new noticeVO();
					nlistvo.setTitle(searchType);
					nlistvo.setContent(searchKeyword);
					
					noticeDAO dao = new noticeDAO();
					final int ROWS_PER_PAGE = 10;
					int totalrows = dao.getSearchTotalRows(searchType, searchKeyword);
					int totalPages = (int) Math.ceil((double)totalrows/ROWS_PER_PAGE);
					int pageNo = NumberUtil.StringToInt(request.getParameter("pno"),1,totalPages);
					int begin = (pageNo -1) * ROWS_PER_PAGE+1;
					int end = pageNo * ROWS_PER_PAGE;
					
					ArrayList<noticeVO> noticeSearch = dao.searchNotice(nlistvo, begin, end);
					System.out.println(totalrows);
					for(noticeVO nvo : noticeSearch){
				%>
						<tr>
							<td style="text-align: center;"><span class="label label-default"><%=nvo.getNo() %></span></td>
							<td><a href="noticedetail.jsp?no=<%=nvo.getNo()%>&pno=<%=pageNo%>"><%=nvo.getTitle() %></a></td>
							<td><%=nvo.getRegdate() %></td>
							<td><%=nvo.getCount() %></td>
						</tr>
				<%
					}
				%>
			</tbody>
		</table>			
		<div class="text-center">
			<ul class="pagination">
				<%
					for(int index=1; index<=totalPages; index++){
				%>	
				<%
						if(index == pageNo){
				%>
						<li class="active"><a href="noticeList.jsp?pno=<%=index %>"><%=index %></a></li>
								
				<%
						}else{
				%>
						<li><a href="noticeList.jsp?pno=<%=index %>"><%=index %></a></li>
				<% 
						}
				%>
				<%	
					}
				%>
			</ul>
		</div>
		</div>
				<%	
				} else {
					noticeDAO dao = new noticeDAO();
					final int ROWS_PER_PAGE = 10;
					noticeDAO pdao = new noticeDAO();
					int totalrows = pdao.getTotalRows();
					int totalPages = (int) Math.ceil((double)totalrows/ROWS_PER_PAGE);
					
					//페이지 번호 알아내기
					/* int pageNo = Integer.parseInt(request.getParameter("pno")); */
					// request.getParameter("pno") --> 선택한 페이지 넘버 만약 값이 null경우 기본값인 1 페이지로 이동
					int pageNo = NumberUtil.StringToInt(request.getParameter("pno"),1,totalPages);
					
					// 조회시 구간시작값과 구간끝값 알아내기
					int begin = (pageNo -1) * ROWS_PER_PAGE+1;
					int end = pageNo * ROWS_PER_PAGE;
					
					ArrayList<noticeVO> noticelist = dao.getnoticeListPaging(begin, end);
					for(noticeVO nvo : noticelist){
				%>
					<tr>
						<td style="text-align: center;"><span class="label label-default"><%=nvo.getNo() %></span></td>
						<td><a href="noticedetail.jsp?no=<%=nvo.getNo()%>&pno=<%=pageNo%>"><%=nvo.getTitle() %></a></td>
						<td><%=nvo.getRegdate() %></td>
						<td><%=nvo.getCount() %></td>
					</tr>
				<%	
					}
				%>
			</tbody>
		</table>
		<div class="text-center">
			<ul class="pagination">
				<%
					for(int index=1; index<=totalPages; index++){
				%>	
				<%
						if(index == pageNo){
				%>
						<li class="active"><a href="noticeList.jsp?pno=<%=index %>"><%=index %></a></li>
								
				<%
						}else{
				%>
						<li><a href="noticeList.jsp?pno=<%=index %>"><%=index %></a></li>
				<% 
						}
				%>
				<%	
					}
				%>
			</ul>
		</div>
	<%
	}
	%>
	</div>
		<div class="pannel-footer text-center">
			
		</div>
	</div>
</div>
</div>
<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>