<%@page import="vo.ProgramApplyVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProgramApplyDAO"%>
<%@page import="vo.ProgramVO"%>
<%@page import="dao.ProgramDAO"%>
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
<title>Program Detail</title>
<style type="text/css">
	.container.sub{
		background: #e9ebee;
		float: none;
    	width: 100%;
    	margin-bottom: 15px;
	}
	.show_summary {
		margin: 10px 0 30px;
	}
	.show_thumb{
		position: relative;
 	   	overflow: hidden;
	    width: 459px;
	    height: 302px;
 	   	background: #f5f5f5;
 	   	text-align: center;
	}
	.show_info {
	    display: block;
    	float: left;
    	height: 302px;
    	padding: 2px 0 2px 10px;
	}
	.btn_apply {
	    border: 1px solid #f75a95;
    	color: #d65071;
    	background: #eaebef;
    	position: absolute;
		right: 150px;
    	bottom: 0;
    	width: 189px;
    	font-size: 18px;
    	line-height: 48px;
    	text-align: center;
	}
	.tit_info {
		overflow: hidden;
    	margin-bottom: 25px;
    	padding-bottom: 10px;
    	border-bottom: 1px solid #969799;
    	color: #000;
    	font-size: 20px;
    	font-weight: 
	}
	
	
	
	
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
<div class="container-fluid main-container" style="padding-left: 0; padding-right: 0;">	
	<div class="container">	
		<div class="sub">
			<div class="reactWrap">
				<div class="page_title">
					<h2 class="tit">공연안내</h2>
				</div>
			</div>
				<!-- 공연정보 -->
			<div class="show_summary">
				<div class="col-md-6">
					<div class="show_thumb">
						<%
							int no = Integer.parseInt(request.getParameter("pno"));
							ProgramDAO dao = new ProgramDAO();
							ProgramVO program = dao.getProgramByNo(no);
						%>	
						<!-- 이미지 삽입 -->
						<img class="" alt="<%=program.getArtistName() %>" width="459px" src="/photoGallery/<%=program.getPhotofile()%>">
					</div>
				</div>	
				<div class="col-md-6">
					<div class="show_info">
						<h3 class="">
							<!-- 공연 정보 -->
							<strong><%=program.getArtistName() %></strong>&nbsp; &nbsp;<%=program.getProgramName() %>
						</h3>
						<dl></dl>
						<h4>
							<strong>공연일시</strong>&nbsp; &nbsp;&nbsp; &nbsp;<%=program.getProgramDate() %>
						</h4>
						<dl></dl>
						<h4>
							<strong>아티스트</strong>&nbsp; &nbsp;&nbsp; &nbsp;<%=program.getArtistName() %>
						</h4>
						<!-- 공연 신청 버튼 -->
						   <%
   								String err = request.getParameter("err");
 								String errorMessage = null;  		
   								if (err != null){
   									if(err.equals("duplication")){
   										errorMessage = "이미 신청한 공연입니다.";
   									}
   								}	
  							 %>
   
  							<%
   								if(errorMessage != null) {
  							%>
   								<p style="font-type:italic;color:red;font-size:20pt;font-weight: bold;"><%=errorMessage %></p>
   							<%			
   								}
  				 			%>
						<a href="/program/programapply.jsp?ano=<%=no %>" class="btn_apply" >공연신청</a>
					</div>
				</div>
			</div>
			<div class="show_story">
				&nbsp;<br>
				<!-- 공연 정보 타이틀-->
				<h4 class="tit_info">공연정보</h4>
				<!-- 공연 정보 상세 -->
				<div class="stroy_area" style="margin-bottom: 30px;">
					<div align="center" style="text-align:center;">
						<span>
							<b><%=program.getProgramName() %></b>
						</span>
					</div>
					<div align="center" style="text-align:center;">
						<span style="font-size: 11pt;">
							<b><%=program.getArtistName() %></b>
						</span>
					</div>
					<div><br></div>
					<div>
						<%=program.getProgramDescription() %>
					</div>
					
				</div>
			</div>	
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</div>
</body>
<script type="text/javascript">
	
</script>
</html>