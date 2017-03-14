<%@page import="vo.ProgramVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProgramDAO"%>
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
<title>당첨관리</title>
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
		<div class="col-sm-10 col-sm-offset-1">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>당첨관리</h4>
				</div>
				<div class="panel-body">
					<table class="table table-condensed">
						<thead>
							<tr>
								<th>NO</th>
								<th>공연번호</th>
								<th>공연명</th>
								<th>아티스트명</th>
								<th>공연일</th>
								<th>당첨발표일</th>
							</tr>
						</thead>
						<tbody>
						<%
							ProgramDAO dao = new ProgramDAO();
							int index = 1;
							
							ArrayList<ProgramVO> programList = dao.getAllProgramListForAdmin();
							
							for (ProgramVO program : programList) {
						%>
							<tr>
								<td><%=index++ %></td>
								<td><%=program.getProgramNo() %></td>
								<td><a href="confirmationuserlist.jsp?pno=<%=program.getProgramNo() %>"><%=program.getProgramName() %></a></td>
								<td><%=program.getArtistName() %></td>
								<td><%=program.getProgramDate() %></td>
								<td><%=program.getAnnounceDate() %></td>
							</tr>
						<%
							}
						%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>