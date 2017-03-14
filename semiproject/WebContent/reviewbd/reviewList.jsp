<%@page import="util.ChangeStr"%>
<%@page import="util.NumberUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.ReviewVO"%>
<%@page import="dao.ReviewDAO"%>
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
<title>리뷰게시판 | 스페이스공감 - 교육의 중심 EBS</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<div class="container-fluid  main-container" style="padding-left: 0; padding-right: 0;">
<div class="container">
	<div class="col-md-12">
	<div class="panel panel-default">
		<div id="top-title" class="panel-heading">
			<h2><strong>공연 . 방송 관람후기</strong></h2>
			<p>EBS 스페이스공감의 공연이나 방송을 보신 후 소중한 감상을 남겨주세요.</p>
			<form method="post" action="reviewList.jsp" name="search" class="form-inline">
				<div class="form-group" style="padding-top: 10px; width: 100%; text-align: center;">
					<select class="form-control" name="searchname">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="userid">작성자</option>
					</select>
					<input type="text" class="form-control" name="searchkey" placeholder="검색어 입력." style="width: 76%;" id="search_input"/>
					<button type="submit" class="btn btn-info" style="width: 76px;">검색</button>				
				</div>	
			</form>
		</div>
		<div class="panel-body">
  					<%
  					request.setCharacterEncoding("utf-8");
  					
					String searchKeyword = request.getParameter("searchkey");
					String searchType = request.getParameter("searchname");
					System.out.println(searchKeyword);
					System.out.println(searchType);
					
					if(searchType != null || searchKeyword != null){
						
						ReviewDAO rdao = new ReviewDAO();
						ReviewVO rvos = new ReviewVO();
						rvos.setTitle(searchType);
						rvos.setContent(searchKeyword);
						
						ArrayList<ReviewVO> rvolist = new ArrayList<>();
						final int ROWS_PER_PAGE = 10;
	  					int totalrows = rdao.getSearchTotalRows(searchType, searchKeyword);
	  					int totalPages = (int) Math.ceil((double)totalrows/ROWS_PER_PAGE);
	  					
	  					int pageNo = NumberUtil.StringToInt(request.getParameter("pno"),1,totalPages);
	  					
	  					int begin = (pageNo -1) * ROWS_PER_PAGE+1;
	  					int end = pageNo * ROWS_PER_PAGE;
	  					System.out.println(totalrows);
	  					System.out.println(totalPages);
	  					
	  					final int pageNumber = 5;
	  					int ppp = totalPages%pageNumber;
	  					System.out.println(ppp);
	  					int pageBegin = ((pageNo -1)/10) * pageNumber+1;
	  					
	  					
	  					int pageEnd = pageBegin * pageNumber;
	  					System.out.println(pageEnd);
	  					if(pageNo > 1){
	  						pageBegin = pageNo;
	  						pageEnd +=ppp;
	  					}
	  					
	  					rvolist = rdao.searchReview(rvos, begin, end);
	  					%>
	  		  	  	<table class="table table-condensed table-hover table-responsive">
						<thead>
							<tr>
							</tr>
  						</thead>
	  					<%
	  					for(ReviewVO rvo : rvolist){	
	  		  	  		%>
  						<tbody>
	  		  	  			<tr>
	  		  	    			<td colspan="3">
	  		  	    				<%
	  		  	    					String changename = ChangeStr.changeName(rvo.getUserName());
	  		  	    					String changeId = ChangeStr.changeName(rvo.getUserId());
	  		  	    				%>
	  		  	    				<p class="text-left"style="color: silver;font: italic;"><%=changename %>(<%=changeId %>) | <%=rvo.getRegdate() %></p>
	  		  	    				<p class="text-left"><a href="reviewDetail.jsp?no=<%=rvo.getNo()%>&pno=<%=pageNo%>"><span style="color: gray;"><%=rvo.getProgramName() %></span> | <strong style="color: black;"><%=rvo.getTitle() %></strong></a></p>
	  		  	    			</td>
	  		  					<td colspan="2" style="vertical-align: middle; color: orange; font-size: 1.3em; text-align: right;">
	  		  						<span class="glyphicon glyphicon-star" aria-hidden="true" style="text-align: left;"></span><%=rvo.getScore() %>.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		  						<%-- <p style="text-center"><%=rvo.getScore() %> / 5</p> --%>
	  		  					</td>
	  		  				</tr>
									<%
									}
									%>
	  		  			</tbody>
	  				</table> 
	  		  				<div class="text-center">
	  		  					<ul class="pagination">
	  		  					<%
	  						if(pageNo != 1){
	  					%>
	  						<li><a href="reviewList.jsp?pno=<%=pageNo-1%>?searchname=<%=searchType%>&searchkey=<%=searchKeyword%>"><span class="glyphicon glyphicon-menu-left"></span></a></li>
	  					<%		
	  						}
	  					%>
	  					<%
	  						if(searchType != null || searchKeyword != null){
	  							pageEnd = ppp;
	  						}
	  						for(int index=pageBegin; index<=pageEnd; index++){
	  					%>	
	  					<%
	  							if(index == pageNo){
	  					%>
	  							<li class="active"><a href="reviewList.jsp?pno=<%=index %>?searchname=<%=searchType%>&searchkey=<%=searchKeyword%>"><%=index %></a></li>
	  									
	  					<%
	  							}else{
	  					%>
	  							<li><a href="reviewList.jsp?pno=<%=index %>?searchname=<%=searchType%>&searchkey=<%=searchKeyword%>"><%=index %></a></li>
	  					<% 
	  							}
	  					%>
	  					<%	
	  						}
	  						if(pageNo < pageNumber+ppp){
	  					%>
	  						<li><a href="reviewList.jsp?pno=<%=pageNo+1%>?searchname=<%=searchType%>&searchkey=<%=searchKeyword%>"><span class="glyphicon glyphicon-menu-right"></span></a></li>
	  					<%
	  						}
	  					%>
	  		  			</ul>
	  		  		</div> 		  				 		  				
	  				<%	
					} else if (searchType == null && searchKeyword == null){
						ReviewDAO rdao = new ReviewDAO();
  	  					ArrayList<ReviewVO> rvolist = new ArrayList<>();
  						final int ROWS_PER_PAGE = 10;
	  					int totalrows = rdao.getTotalRows();
	  					int totalPages = (int) Math.ceil((double)totalrows/ROWS_PER_PAGE);
	  						  					
	  					int pageNo = NumberUtil.StringToInt(request.getParameter("pno"),1,totalPages);
	  					
	  					int begin = (pageNo -1) * ROWS_PER_PAGE+1;
	  					int end = pageNo * ROWS_PER_PAGE;
	  					
	  					final int pageNumber = 5;
	  					int ppp = totalPages%pageNumber;
	  					int pageBegin = ((pageNo -1)/10) * pageNumber+1;
	  					
	  					int pageEnd = pageBegin * pageNumber;
	  					if(pageNo >1){
	  						pageBegin = pageNo;
	  						pageEnd +=ppp;
	  					}
	  					
	  					System.out.println(pageBegin);
	  					System.out.println(pageEnd);
	  					
	  					rvolist = rdao.getReviewListPaging(begin, end);
	  				%>
	  	  		<table class="table table-condensed table-hover table-responsive">
					<thead>
						<tr>
						</tr>	
  					</thead>
	  				<%
	  					for(ReviewVO rvo : rvolist){	
	  	  			%>
  					<tbody>
	  	  				<tr>
	  	    				<td colspan="3">
	  	    					<%
	  		  	    				String changename = ChangeStr.changeName(rvo.getUserName());
	  	    						String changeId = ChangeStr.changeName(rvo.getUserId());
	  		  	    			%>
	  	    					<p class="text-left" style="color: silver;font: italic;"><%=changename %>(<%=changeId %>) | <%=rvo.getRegdate() %></p>
	  	    					<p class="text-left"><a href="reviewDetail.jsp?no=<%=rvo.getNo()%>&pno=<%=pageNo%>"><span style="color: gray;"><%=rvo.getProgramName() %></span> | <strong style="color: black;"><%=rvo.getTitle() %></strong></a></p>
	  	    				</td>
	  	    				
	  						<td colspan="2" style="vertical-align: middle; color: orange; font-size: 1.3em; text-align:right;">
	  							<span class="glyphicon glyphicon-star" aria-hidden="true" style="text-align: left;"></span><%=rvo.getScore() %>.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  								<%-- <p style="text-center"><%=rvo.getScore() %> / 5</p> --%>
	  						</td>
	  					</tr>
	  						<% 
	  						}
	  						%>
	  				</tbody>
	  			</table>
	  				<div class="text-center">
	  					<ul class="pagination">
	  					<%
	  						if(pageNo != 1){
	  					%>
	  						<li><a href="reviewList.jsp?pno=<%=pageNo-1%>"><span class="glyphicon glyphicon-menu-left"></span></a></li>
	  					<%		
	  						}
	  					%>
	  					<%
	  						for(int index=pageBegin; index<=pageEnd; index++){
	  					%>	
	  					<%
	  							if(index == pageNo){
	  					%>
	  							<li class="active"><a href="reviewList.jsp?pno=<%=index %>"><%=index %></a></li>
	  									
	  					<%
	  							}else{
	  					%>
	  							<li><a href="reviewList.jsp?pno=<%=index %>"><%=index %></a></li>
	  					<% 
	  							}
	  					%>
	  					<%	
	  						}
	  						if(pageNo < pageNumber+ppp){
	  					%>
	  						<li><a href="reviewList.jsp?pno=<%=pageNo+1%>"><span class="glyphicon glyphicon-menu-right"></span></a></li>
	  					<%
	  						}
	  					%>
	  					</ul>
	  				</div>
	  			<%
	  			}
	  			%>				  						
		</div>
		
		<div class="panel-footer text-right">
		<%
		if(user != null){
		%>
		<p><a href="reviewForm.jsp" class="btn btn-default">등록</a><p>
		<%
		}	
		%>
		</div>
	</div>
	</div>
</div>
	<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>