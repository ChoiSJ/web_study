<%@page import="vo.QnaVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.NumberUtil"%>
<%@page import="dao.QnaDAO"%>
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
<title>Admin QnA List</title>
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
					<h4>QnA 게시판</h4>
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
							QnaDAO dao = new QnaDAO();
							final int ROWS_PER_PAGE = 10;
							
							int totalrows = dao.getTotalRows();
							int totalPages = (int) Math.ceil((double)totalrows/ROWS_PER_PAGE);
							int pageNo = NumberUtil.StringToInt(request.getParameter("pno"), 1, totalPages);
							
							int begin = (pageNo-1)*ROWS_PER_PAGE+1;
							int end = pageNo*ROWS_PER_PAGE;
							
							ArrayList<QnaVO> qnaList = dao.getListForPaging(begin, end);
							
							for (QnaVO qna : qnaList) {
						%>
							<tr>
								<td><%=qna.getNo() %></td>
								<td><a href="qnamodify.jsp?mno=<%=qna.getNo() %>"><%=qna.getTitle() %></a></td>
								<td><%=qna.getWriter() %></td>
								<td><%=qna.getRegdate() %></td>
								<td><input type="checkbox" name="delete-no" value="<%=qna.getNo() %>"></td>
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
						%>
							<li><a href="adminqnalist.jsp?pno=<%=index %>"><%=index %></a></li>
						<%
								} else {
						%>
							<li><a href="adminqnalist.jsp?pno=<%=index %>"><%=index %></a></li>
						<%
								}
						%>
						<%
							}
						%>
						</ul>
					</div>
				</div>
				<div class="panel-footer text-right">
					<button class="btn btn-default" onclick="deleteFree()">삭제</button>
					<form id="delete-form" method="post" action="deleteqnaprocess.jsp"></form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	function deleteFree() {
		var html = "";
		var checkboxList = document.getElementsByName("delete-no");
		
		for (var i=0; i<checkboxList.length; i++) {
			var checkbox = checkboxList[i];
			
			if (checkbox.checked) {
				var qnaNo = checkbox.value;
				
				html += '<input type="hidden" name="dno" value="'+qnaNo+'">'
			}
		}
		
		var form = document.getElementById("delete-form");
		form.innerHTML = html;
		form.submit();
	}
</script>
</html>