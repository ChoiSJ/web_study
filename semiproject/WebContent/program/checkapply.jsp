<%@page import="vo.ProgramVO"%>
<%@page import="dao.ProgramDAO"%>
<%@page import="vo.ProgramApplyVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProgramApplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html >
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.index {
		width: 100%;
		background-color: #f2f2f2;
		height: 70px;
	}
	.apply-list {
		list-style:none;
   		margin-left: -40px;
   		margin-top:20px;
	}
	.container {
		margin-top: 70px;
	}
	.thumbnail {
		width: 300px;
		height: 420px;
		padding: 20px;
	}
	.p {
		text-align: left; 
	}
	.btn_area {
		text-align: right;
	}
	.btn_cancle {
		border: 1px solid #f66198;
    	background: #f66198;
    	color: #fff;
	}
	.btn_result1 {
		border: 1px solid green;
    	background: green;
    	color: #fff;
	}
	.btn_result2 {
		border: 1px solid maroon;
    	background: maroon;
    	color: #fff;
	}
	.btn_result3 {
		border: 1px solid gray;
    	background: gray;
    	color: #fff;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%
	if(user == null){
		response.sendRedirect("/account/login.jsp");
		return;
	}
	%>
<div class="container-fluid main-container" style="padding-left: 0; padding-right: 0;">	
	<div class="index">
		<div class="col-md-6 col-md-offset-2 ">
			<h3><strong>공연 당첨 확인</strong></h3>
		</div>
	</div>
<div class="container">
	<div class="main_area">
		<div class="row">
			<div class="col-sm-12"> 
				<ul class="apply-list">
				<%
					ProgramApplyDAO dao = new ProgramApplyDAO();
					ArrayList<ProgramApplyVO> applyList = dao.getAllApplyListById(user.getUserId());
					for (ProgramApplyVO apply : applyList) {
					
				%>
					<li class="col-sm-4">
						<div class="thumbnail">
							<a href="/program/programdetail.jsp?pno=<%=apply.getProgramNo()%>">
								<%
									ProgramDAO pdao = new ProgramDAO();
									ProgramVO program = pdao.getProgramByNo(apply.getProgramNo());
								%>
								<img src="/photoGallery/<%=program.getPhotofile()%>">
							</a>
							<div class="caption">
								<p class="p">
									<br>
									<h4><%=program.getProgramName() %></h4>
									<a>신청공연일자 :<%=program.getProgramDate() %></a><br />
									<a>신청자정보 :<%=user.getUserName() %></a><br />
									<a>신청매수 :<%=apply.getCountTicket() %></a><br />
									<a>신청일 :<%=apply.getApplyDate() %></a><br />
									<!-- 신청취소 버튼 -->
									<div class="btn_area">
										
										<%
											if("신청중".equals(apply.getResult())){
										%>
										<button class="btn_result1 btn btn-xs" disabled="disabled"><%=apply.getResult() %></button>
										<a href="/program/applycancle.jsp?ano=<%=apply.getApplyNo() %>" class="btn btn-xs btn_cancle">신청취소</a>
										<%
											} else if ("당첨".equals(apply.getResult())) {
										%>
										<button class="btn_result2 btn btn-xs disabled"><%=apply.getResult() %></button>
										<% 
											} else if ("다음기회에".equals(apply.getResult())) {
										%>	
										<button class="btn_result3 btn btn-xs disabled"><%=apply.getResult() %></button>
										<% 
											}
										%>
									</div>
								</p>
							</div>	
						</div>
					</li>
				<%
						}
					
				%>	
				</ul>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>