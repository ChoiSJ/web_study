<%@page import="util.NumberUtil"%>
<%@page import="dao.TodoDAO"%>
<%@page import="vo.TodoVO"%>
<%@page import="java.util.ArrayList"%>
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
<title>Todo Application</title>
</head>
<body>
<%@ include file="common/head.jsp" %>

	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="panel panel-default">
					<div class="panel-heading">일정 리스트</div>
					<div class="panel-body">
						<table class="table">
							<colgroup>
								<col width="50%">
								<col width="15%">
								<col width="15%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th>제목</th>
									<th>일시</th>
									<th>완료여부</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<% 	
								final int ROWS_PER_PAGE = 10;
							
								TodoDAO todoDao = new TodoDAO();
								
								// 내가 등록한 총 일정갯수 조회
								int totalRows = todoDao.getTotalRows(user.getId());
								
								// 총 페이지 갯수
								int totalPages = (int) Math.ceil((double)totalRows/ROWS_PER_PAGE);
								
								// 페이지 번호 알아내기
								int pageNo = NumberUtil.StringToInt(request.getParameter("pno"), 1);
								
								// 조회시 구간시작값과 구간끝값 알아내기
								int beginIndex = (pageNo - 1) * ROWS_PER_PAGE + 1;
								int endIndex = pageNo * ROWS_PER_PAGE;
								
								// 요청한 페이지에 해당하는 일정 조회하기
								ArrayList<TodoVO> todoList = todoDao.getTodoListForPaging(beginIndex, endIndex, user.getId());
								
								for (TodoVO todo : todoList) {
							%>
									<tr>
										<td><a href="detail.jsp?tno=<%=todo.getNo() %>&pno=<%=pageNo %>"><%=todo.getTitle() %></a></td>
										<td><%=todo.getDay() %></td>
										<td><%=todo.getCompleted() %></td>
										<td>
											<a href="completed.jsp?tno=<%=todo.getNo() %>&pno=<%=pageNo %>" class="btn btn-success">완료</a>
											<a href="delete.jsp?tno=<%=todo.getNo() %>&pno=<%=pageNo %>" class="btn btn-danger">삭제</a>
										</td>
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
							<li class="active"><a href="list.jsp?pno=<%=index %>"><%=index %></a></li>
							<%	
							} else {
							%>
							<li><a href="list.jsp?pno=<%=index %>"><%=index %></a></li>
							<%	
							} 
							%>
							
						<% } %>	
						</ul>
						</div>
					</div>
					<div class="panel-footer text-right">
						<a href="registerform.jsp" class="btn btn-default">새 일정 등록</a>
					</div>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>