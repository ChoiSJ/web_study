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
<title>Admin Review List</title>
<style type="text/css">
	.container {
		margin-top: 50px;
	}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>

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
				<div class="panel-heading"><h4>리뷰 게시판</h4></div>
				<div class="panel-body">
					<table class="table table-condensed">
						<thead>
							<tr>
								<td>No</td>
								<td>공연명</td>
								<td>아티스트명</td>
								<td>공연일</td>
							</tr>
						</thead>
						<tbody>
					<% 
						ReviewDAO dao = new ReviewDAO();
						ArrayList<ReviewVO> reviewProgramList = dao.getReviewProgramList();
						int index = 1;
						
						for (ReviewVO review : reviewProgramList) {
							int dateIndexFirstNumber = review.getProgramName().indexOf("[");
							int dateIndexLastNumber = review.getProgramName().lastIndexOf("]");
							String programDate = review.getProgramName().substring(dateIndexFirstNumber+1, dateIndexLastNumber);
							
							int artistIndexFirstNumber = review.getProgramName().indexOf("(");
							int artistIndexLastNumber = review.getProgramName().lastIndexOf(")");
							String artist = review.getProgramName().substring(artistIndexFirstNumber+1, artistIndexLastNumber);
							
							String programName = review.getProgramName().substring(dateIndexLastNumber+2, artistIndexFirstNumber-1);
					%>
							<tr>
								<td><%=index++ %></td>
								<td><a href="reviewdetail.jsp?pn=<%=programName %>&an=<%=artist %>"><%=programName %></a></td>
								<td><%=artist %></td>
								<td><%=programDate %></td>
							</tr>
					<% 
						}
					%>
						</tbody>
					</table>
				</div>
				<div class="panel-footer">
				
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>