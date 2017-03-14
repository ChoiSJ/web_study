<%@page import="util.NumberUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
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
<title>유저관리</title>
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
					<h4>사용자 정보 관리</h4>
				</div>
				<div class="panel-body">
					<table class="table table-condensed">
						<thead>
							<tr>
								<th>번호</th>
								<th>아이디</th>
								<th>이름</th>
								<th>생일</th>
								<th>전화번호</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
						<%
							final int ROWS_PER_PAGE = 10;
							
							UserDAO dao = new UserDAO();
							int totalRows = dao.getTotalRows();
							int totalPages = (int) Math.ceil((double)totalRows/ROWS_PER_PAGE);
							int pageNo = NumberUtil.StringToInt(request.getParameter("pno"), 1);
							
							int beginIndex = (pageNo - 1) * ROWS_PER_PAGE + 1;
				    		int endIndex = pageNo * ROWS_PER_PAGE;
				    		
				    		ArrayList<UserVO> userList = dao.getUserListForPaging(beginIndex, endIndex);
				    		
							for (UserVO vo : userList) {
						%>
							<tr>
								<td><%=vo.getUserNo() %></td>
								<td><%=vo.getUserId() %></td>
								<td><%=vo.getUserName() %></td>
								<td><%=vo.getUserBirth() %></td>
								<td><%=vo.getUserTel() %></td>
								<td><a href="usermodify.jsp?uno=<%=vo.getUserNo() %>" class="btn btn-success">수정</a></td>
							</tr>
						<%
							}
						%>
						</tbody>
					</table>
					<div class="text-center">
						<ul class="pagination">
						<%
							for (int index=1; index<=totalPages; index++) {
								
								if (index == pageNo) {
						%>
							<li class="active"><a href="userlist.jsp?pno=<%=index %>"><%=index %></a></li>		
						
						<%			
								} else {
						%>
							<li><a href="userlist.jsp?pno=<%=index %>"><%=index %></a></li>
						<%			
								}

							}
						%>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>