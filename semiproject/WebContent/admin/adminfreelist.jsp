<%@page import="javax.management.modelmbean.RequiredModelMBean"%>
<%@page import="vo.FreeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.FreeDAO"%>
<%@page import="util.NumberUtil"%>
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
<title>Admin Free List</title>
<style type="text/css">
	.container {
		padding-top: 50px;
	}
</style>
</head>
<body>
<%@ include file="/common/header.jsp" %>
<%
	if (user == null || !"admin1234".equals(user.getUserId())) {
		response.sendRedirect("/main.jsp");
		return;
	}
%>
<div class="container">
	<div class="row">
		<div class="col-sm-8 col-sm-offset-2">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>자유게시판</h4>
					<form id="search-form" method="post" action="searchfreeprocess.jsp">
						<div class="col-sm-2 col-sm-offset-2" style="padding-left: 10px; padding-right: 10px;">
							<select name="selected-option" id="selected-option" class="form-control">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
							</select>
						</div>
						<div class="col-sm-6 col-sm-offset-2 input-group form-group">
							<input id="search-word" type="text" class="form-control" placeholder="Search" name="word">
							<div class="input-group-btn">
								<button class="btn btn-default" form="search-form"><i class="glyphicon glyphicon-search"></i></button>
							</div>
							<input type="hidden" name="pno" value="<%=request.getParameter("pno") %>">
						</div>
					</form>
				</div>
				<div class="panel-body">
					<table class="table table-striped table-condensed">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
						<% 
							FreeDAO dao = new FreeDAO();
							ArrayList<FreeVO> freeList = new ArrayList<>();
							ArrayList<FreeVO> freeResultList = (ArrayList<FreeVO>) request.getAttribute("searchResultArr");
							String result = (String) request.getAttribute("result");
							String selectedOption = (String) request.getAttribute("selected-option");
							String word = (String) request.getAttribute("word");
							String isSearch = "false";
							isSearch = request.getParameter("ch");
							
							if (isSearch == null) {
								isSearch = "false";
							} else if (isSearch.equals("true")) {
								result = "Y";
							}
							
							int totalrows = 0;
							
							if (result == null) {
								totalrows = dao.getTotalRows();
							} else if (result.equals("Y")) {
								totalrows = freeResultList.size();
								isSearch = "true";
							}
							
							
							final int ROWS_PER_PAGE = 10;
							int totalPages = (int) Math.ceil((double)totalrows/ROWS_PER_PAGE);
							int pageNo = NumberUtil.StringToInt(request.getParameter("pno"), 1);
							
							int begin = (pageNo-1)*ROWS_PER_PAGE+1;
							int end = pageNo*ROWS_PER_PAGE;
							if (freeResultList == null) {
								freeList = dao.getListForPaging(begin, end);
							} else {
								if (end > freeResultList.size()) {
									end = freeResultList.size();
								}
	
								int no = 0;
								for (int i=begin; i<=end; i++) {
									freeList.add(freeResultList.get(i-1));
								}
							}
						
							for (FreeVO free : freeList) {
						%>
							<tr>
								<td><%=free.getNo() %></td>	
								<td><a href="freemodify.jsp?mno=<%=free.getNo() %>"><%=free.getTitle() %></a></td>	
								<td><%=free.getWriter() %></td>
								<td><%=free.getRegdate() %></td>
								<td>
									<input type="checkbox" name="delete-no" value="<%=free.getNo() %>">
								</td>	
							</tr>
						<%
							}
						%>
						</tbody>
					</table>
					<div class="text-center">
						<ul class="pagination" style="margin: 0">
						<%
							for (int index=1; index<=totalPages; index++) {
						%>
						<%
								if (index == pageNo) {
									if (freeResultList != null) { 
						%>
										<li class="active"><a href="searchfreeprocess.jsp?pno=<%=index %>&ch=<%=isSearch %>&selected-option=<%=selectedOption %>&word=<%=word %>"><%=index %></a></li>
						<%
									} else {
						%>
										<li class="active"><a href="adminfreelist.jsp?pno=<%=index %>&ch=<%=isSearch %>"><%=index %></a></li>
						<%
									}		
						%>
						<%
								} else {
									if (freeResultList != null) {
						%>
										<li><a href="searchfreeprocess.jsp?pno=<%=index %>&ch=<%=isSearch %>&selected-option=<%=selectedOption %>&word=<%=word %>"><%=index %></a></li>
						<%
									} else {
						%>
										<li><a href="adminfreelist.jsp?pno=<%=index %>&ch=<%=isSearch %>"><%=index %></a></li>
						<%
									}		
						%>
						<%
								}
						%>
						<%
							}
						%>
						</ul>
					</div>
				</div>
				<div class="panel-footer" style="text-align: right;">
					<button class="btn btn-default" onclick="deleteFree()">삭제</button>
					<form id="delete-form" method="post" action="deletefreeprocess.jsp"></form>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function deleteFree() { 
		var html = "";
		var checkboxList = document.getElementsByName("delete-no");
		for (var i=0; i<checkboxList.length; i++) {
			var checkbox = checkboxList[i];
			
			if (checkbox.checked) {
				var freeNo = checkbox.value;
				
				html += '<input type="hidden" name="dno" value="'+freeNo+'">'
			}
		}
		
		var form = document.getElementById("delete-form");
		form.innerHTML = html;
		form.submit();
	}
</script>
</body>
</html>