<%@page import="vo.ProgramApplyVO"%>
<%@page import="dao.ProgramApplyDAO"%>
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
<title>Insert title here</title>
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
				<%
					ProgramApplyDAO dao = new ProgramApplyDAO();
					int no = Integer.parseInt(request.getParameter("pno"));
					int index = 1;
					
					ArrayList<ProgramApplyVO> userList = dao.getUserListByProNo(no);
					ProgramDAO pdao = new ProgramDAO();
					int crowdNo = pdao.getCrowdNumber(no);
				%>
				<div class="panel-heading">
					<h4>신청 회원 리스트</h4>
					<p>정원: <%=crowdNo %></p>
				</div>
				<div class="panel-body">
					<table class="table table-condensed">
						<thead>
							<tr>
								<th>NO</th>
								<th>아이디</th>
								<th>신청 프로그램</th>
								<th>신청 매수</th>
								<th>전화번호</th>
								<th>상태</th>
								<th>당첨여부</th>
							</tr>
						</thead>
						<tbody>
				<%
					for (ProgramApplyVO pUser : userList) {
						if(crowdNo == 0 && "신청중".equals(pUser.getResult())) {
							pUser.setResult("다음기회에");
							dao.failPro(pUser.getApplyNo());
						}
				%>
							<tr>
								<td><%=index++ %></td>
								<td><a href="#" onclick="showMyModal(<%=pUser.getApplyNo()%>)"><span id="sp-id-<%=pUser.getApplyNo()%>"><%=pUser.getUserId() %></span></a></td>
								<td><span id="sp-pn-<%=pUser.getApplyNo()%>"><%=pUser.getProgramNo() %></span></td>
								<td style="display: none"><span id="sp-st-<%=pUser.getApplyNo()%>"><%=pUser.getUserStory() %></span></td>
								<td><span id="sp-tk-<%=pUser.getApplyNo()%>"><%=pUser.getCountTicket() %></span></td>
								<td><span id="sp-tel-<%=pUser.getApplyNo()%>"><%=pUser.getApplyTel() %></span></td>
								<td>
							<%
								if ("당첨".equals(pUser.getResult())) {
							%>	
								<button class="btn btn-success"><%=pUser.getResult() %></button>
							<%	
								} else if ("다음기회에".equals(pUser.getResult())) {
							%>
								<button class="btn btn-danger"><%=pUser.getResult() %></button>
							<%		
								} else {
							%>
								<button class="btn btn-info"><%=pUser.getResult() %></button>
							<%		
								}
							%>
								</td>
								<td>
								<a href="/admin/confirmationprocess.jsp?pno=<%=no %>&cno=1&ano=<%=pUser.getApplyNo() %>" class="btn btn-success">당첨</a>
								<a href="/admin/confirmationprocess.jsp?pno=<%=no %>&cno=2&ano=<%=pUser.getApplyNo() %>" class="btn btn-danger">다음기회에</a>
								</td>
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
	
	<div class="modal fade" id="myModal" role="dialog">
		<input type="hidden" id="apply-no" />
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title"><span id="headerid-field"></span>님의 신청정보</h3>
				</div>
				<div class="modal-body">
					<table class="table table-condensed">
						<tbody>
							<tr>
								<th>신청번호</th>
								<td><span id="no-field"></span></td>
							</tr>
							<tr>
								<th>아이디</th>
								<td><span id="id-field"></span></td>
							</tr>
							<tr>
								<th>신청공연</th>
								<td><span id="pn-field"></span></td>
							</tr>
							<tr>
								<th>사연</th>
								<td><span id="st-field"></span></td>
							</tr>
							<tr>
								<th>신청매수</th>
								<td><span id="tk-field"></span></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><span id="tel-field"></span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
</div>
</body>
<script type="text/javascript">
	function showMyModal(applyNo) {
		$('#myModal').modal('show');
		document.getElementById("apply-no").value = applyNo;
	}

	$('#myModal').on('shown.bs.modal', function (e) {
	 	var applyNo = document.getElementById("apply-no").value;
	 	
	 	document.getElementById("no-field").textContent = applyNo;
	 	document.getElementById("headerid-field").textContent = document.getElementById("sp-id-"+applyNo).textContent;
	 	document.getElementById("id-field").textContent = document.getElementById("sp-id-"+applyNo).textContent;
	 	document.getElementById("pn-field").textContent = document.getElementById("sp-pn-"+applyNo).textContent;
	 	document.getElementById("st-field").textContent = document.getElementById("sp-st-"+applyNo).textContent;
	 	document.getElementById("tk-field").textContent = document.getElementById("sp-tk-"+applyNo).textContent;
	 	document.getElementById("tel-field").textContent = document.getElementById("sp-tel-"+applyNo).textContent;
	 	
	})
</script>
</html>