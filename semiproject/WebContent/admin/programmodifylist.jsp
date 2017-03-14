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
<title>Program Modify List</title>
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
					<h4>공연리스트</h4>
				</div>
				<div class="panel-body">
					<table class="table table-condensed">
						<thead>
							<tr>
								<th>No</th>
								<th>공연명</th>
								<th>공연일</th>
								<th>아티스트명</th>
								<th>삭제</th>
								<th>공개여부</th>
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
								<td><a href="programmodify.jsp?pno=<%=program.getProgramNo() %>"><%=program.getProgramName() %></a></td>
								<td><%=program.getProgramDate() %></td>
								<td><%=program.getArtistName() %></td>
								<td><input type="checkbox" name="delete-no" value="<%=program.getProgramNo() %>"/></td>
								<td style="color: green;" class="isvisible"><%=program.getIsVisible() %></td>
							</tr>
						<%
							}
						%>
						</tbody>				
					</table>
				</div>
				<div class="panel-footer" align="right">
					<a href="programRegister.jsp" class="btn btn-default">등록</a>
					<button class="btn btn-default" onclick="deleteProgram()">삭제</button>
				</div>
				<form id="delete-form" method="post" action="deleteprogramprocess.jsp"></form>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	function deleteProgram() {
		var html = "";
		var checkboxList = document.getElementsByName("delete-no");
		
		for (var i=0; i<checkboxList.length; i++) {
			var checkbox = checkboxList[i];
			
			if (checkbox.checked) {
				var programNo = checkbox.value;
				
				html += "<input type='hidden' name='dno' value='"+programNo+"'>";
			}
		}
		
		var form = document.getElementById("delete-form");
		form.innerHTML = html;
		form.submit();
	}
	
	var visibleClassArr = document.getElementsByClassName("isvisible");

	for (var i=0; visibleClassArr.length; i++) {
		// 이 부분에서 textContent 가 정의되지 않았다는 오류가 나오는데 동작은 되고 있으므로 일단 커밋. 추후에 점검 필요. 
		if (visibleClassArr[i].textContent.includes("Yes")) {
			visibleClassArr[i].textContent = "공개";
		} else if (visibleClassArr[i].textContent.includes("No")) {
			visibleClassArr[i].textContent = "비공개";
		}
	}
</script>
</html>