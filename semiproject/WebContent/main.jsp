<%@page import="vo.noticeVO"%>
<%@page import="dao.noticeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.ProgramVO"%>
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
<title>MAIN</title>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
	.navbar {
		margin-bottom: 0;
		border-radius: 0;
	}

/* Add a gray background color and some padding to the footer */
	footer {
		background-color: #f2f2f2;
		padding: 25px;
	}

	.carousel-inner img {
		width: 100%; /* Set width to 100% */
		margin: auto;
		min-height: 200px;
	}
	.main-info {
		margin-top: 50px;
		
	}
	.program-thumb {
		width: 170spx;
		height: 150px;
	}
	.main-prog-img {
		width: 120px;
		height: 60px;
		overflow: hidden;
	}
	.notice-box {
		margin-left: 20px;
	}

/* Hide the carousel text when the screen is less than 600 pixels wide */
	@media ( max-width : 600px) {
		.carousel-caption {
			display: none;
		}
	}
</style>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
<div class="container-fluid main-container" style="padding-left: 0; padding-right: 0;">
	<!-- 슬라이드 시작 -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
			<li data-target="#myCarousel" data-slide-to="5"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<%
					ProgramDAO pdao = new ProgramDAO();
					ArrayList<ProgramVO> mainprogramList = pdao.getAllProgramListForMain();
					ProgramVO program1 = mainprogramList.get(0);
					ProgramVO program2 = mainprogramList.get(1);
					ProgramVO program3 = mainprogramList.get(2);
					ProgramVO program4 = mainprogramList.get(3);
					ProgramVO program5 = mainprogramList.get(4);
					ProgramVO program6 = mainprogramList.get(5);
					
				%>
				<a href="/program/programdetail.jsp?pno=<%=program1.getProgramNo()%>"><img class="mySlides" src="/photoGallery/<%=program1.getMainphotoFile()%>" style="width: 100%;"></a>
				<div class="carousel-caption">
					<h3 class="text-right"><%=program1.getArtistName() %></h3>
				</div>
			</div>

			<div class="item">
				<a href="/program/programdetail.jsp?pno=<%=program2.getProgramNo()%>"><img class="mySlides" src="/photoGallery/<%=program2.getMainphotoFile() %>" style="width: 100%;"></a>
				<div class="carousel-caption">
					<h3 class="text-right"><%=program2.getArtistName() %></h3>
				</div>
			</div>

			<div class="item">
				<a href="/program/programdetail.jsp?pno=<%=program3.getProgramNo()%>"><img class="mySlides" src="/photoGallery/<%=program3.getMainphotoFile() %>" style="width: 100%;"></a>
				<div class="carousel-caption">
					<h3 class="text-right"><%=program3.getArtistName() %></h3>
				</div>
			</div>

			<div class="item">
				<a href="/program/programdetail.jsp?pno=<%=program4.getProgramNo()%>"><img class="mySlides" src="/photoGallery/<%=program4.getMainphotoFile() %>" style="width: 100%;"></a>
				<div class="carousel-caption">
					<h3 class="text-right"><%=program4.getArtistName() %></h3>
				</div>
			</div>
			<div class="item">
				<a href="/program/programdetail.jsp?pno=<%=program5.getProgramNo()%>"><img class="mySlides" src="/photoGallery/<%=program5.getMainphotoFile() %>" style="width: 100%;"></a>
				<div class="carousel-caption">
					<h3 class="text-right"><%=program5.getArtistName() %></h3>
				</div>
			</div>
			<div class="item">
				<a href="/program/programdetail.jsp?pno=<%=program6.getProgramNo()%>"><img class="mySlides" src="/photoGallery/<%=program6.getMainphotoFile() %>" style="width: 100%;"></a>
				<div class="carousel-caption">
					<h3 class="text-right"><%=program6.getArtistName() %></h3>
				</div>
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- 슬라이드 끝 -->

	<div class="container text-center main-info">
		<br>
		<div class="row">
			<!-- 공연안내 -->
			<div class="col-sm-4" style="margin: 0;">
				<h3 style="text-align: left;"><strong>공연안내 +</strong></h3>
				<ul style="list-style: none; text-align: left;">
                    <%
						ArrayList<ProgramVO> programList = pdao.getAllProgramList();
                    	ProgramVO program = null;
                    	for (int i=0; i<4; i++) {
                    		program = programList.get(i);
                    %>
                    <li class="col-sm-6" style="padding: 1px;">
                        <div class="thumbnail program-thumb" id="selector-<%=program.getProgramNo()%>">
                        	<a href="/program/programdetail.jsp?pno=<%=program.getProgramNo()%>">
                        		<img class="main-prog-img" src="/photoGallery/<%=program.getPhotofile()%>">
                        	</a>
                        	<div class="caption">
                 		       	<p class="p">
                       		 	<a class="a" href="/program/programdetail.jsp?pno=<%=program.getProgramNo()%>"><%=program.getArtistName()%></a><br />
                       		 	<a class="a" href="/program/programdetail.jsp?pno=<%=program.getProgramNo()%>"><%=program.getProgramDate() %></a><br />
                        		</p>
                        	</div>	
                        </div>
                    </li>
					
					<%
                    	}
					%>
               </ul>
			</div>
			<!-- 동영상 -->
			<div class="col-sm-4">
				<h3 style="text-align: left;"><strong>HOT 영상 +</strong></h3>
				<iframe width="384" height="223" src="https://www.youtube.com/embed/MPhLWgLT4Ik" frameborder="0" allowfullscreen></iframe>
				<div class="row" style="padding: 0 0 0 0; margin-top: 25px;">
				<!-- 투버튼 -->
				<div class="col-xs-6" style="width: 180px;">
					<span ><a href="/program/checkapply.jsp"><img alt="" src="/photoGallery/resultbtn.png" style="border:1px solid #dcdcdc;"></a></span>
				</div>
				<div class="col-xs-6" style="width: 180px;">
					<span><a href="/introduction/map.jsp"><img alt="" src="/photoGallery/routebtn.png" style="border:1px solid #dcdcdc;"></a></span>
				</div>
				</div>
			</div>
			<!-- 공지사항 -->
			<div class="col-sm-4"> 
				<h3 style="text-align: left;"><strong>공지사항 +</strong></h3>
				<div class="notice-box">
					<table style="width: 100%">
						<%
							noticeDAO ndao = new noticeDAO();
							ArrayList<noticeVO> noticeList = ndao.getnoticelistForMain();
							noticeVO notice = null;
							for (int i=0; i<8; i++) {
								notice = noticeList.get(i);
						%>
						<tr>
							<td style="line-height: 40px; width: 70%; text-align: left;">
							<a href="/noticebd/noticedetail.jsp?no=<%=notice.getNo() %>&pno=1"><%=notice.getTitle()%></a>
							</td>
							<td style="text-align: left; right: 0; width: 30%;">
							<%=notice.getRegdate()%>
							</td>
						</tr>
						
						<%
							}
						%>
					</table>
				</div>
			</div>
			
			
		</div>
	</div>
	<br>
	<!-- 
	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>
	 -->
	 <%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>