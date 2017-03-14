<%@page import="dao.TodoDAO"%>
<%@page import="vo.TodoVO"%>
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


<%
	int pageNo = Integer.parseInt(request.getParameter("pno"));
%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-default">
					<div class="panel-heading">일정 상세정보</div>
					<div class="panel-body">
						<table class="table">
							<tbody>
								<%
									int no = Integer.parseInt(request.getParameter("dno"));
									TodoVO todo = new TodoDAO().detailTodo(no);
								%>
								<tr>
									<td>종류</td><td><%=todo.getCategory() %></td>
								</tr>
								<tr>
									<td>제목</td><td><%=todo.getTitle() %></td>
								</tr>
								<tr>
									<td>내용</td><td><%=todo.getDescription() %></td>
								</tr>
								<tr>
									<td>장소</td><td><%=todo.getLocation() %></td>
								</tr>
								<tr>
									<td>일시</td><td><%=todo.getDay() %></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="panel-footer text-right">
						<a href="list.jsp?pno=<%=pageNo %>" class="btn btn-default">리스트로 돌아가기</a>
					</div>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>