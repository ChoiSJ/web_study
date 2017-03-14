<%@page import="vo.ProgramVO"%>
<%@page import="java.util.ArrayList"%>
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
<title>program</title>
<style type="text/css">
	.index {
		width: 100%;
		background-color: #f2f2f2;
		height: 70px;
	}
	.hide-bullets {
   		list-style:none;
   		margin-left: -40px;
   		margin-top:20px;
	}
	.carousel-inner>.item>img, .carousel-inner>.item>a>img {
   		width: 100%;
	}
	.container {
		margin-top: 70px;
	}
	.thumbnail {
		width: 300px;
		height: 300px;
		padding: 20px;
	}
	.p {
		text-align: center; 
	}
	.pro-name {
		font-size: 9pt;
		color: #f5487a;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
<div class="container-fluid main-container" style="padding-left: 0; padding-right: 0;">		
	<div class="index">
		<div class="col-md-6 col-md-offset-2 ">
			<h3><strong>공연안내 및 관람신청</strong></h3>
		</div>
	</div>
<div class="container">
    <div id="main_area">
        <!-- Slider -->
        <div class="row">
            <div class="col-sm-12" id="slider-thumbs">
                <!-- Bottom switcher of slider -->
                <ul class="hide-bullets">
                    <%
                    	ProgramDAO dao = new ProgramDAO();
                    	ArrayList<ProgramVO> programList = dao.getAllProgramList();
                    	for (ProgramVO program : programList) {
                    %>
                    <li class="col-sm-4">
                        <div class="thumbnail" id="selector-<%=program.getProgramNo()%>">
                        	<a href="/program/programdetail.jsp?pno=<%=program.getProgramNo()%>">
                        		<img src="/photoGallery/<%=program.getPhotofile()%>">
                        	</a>
                        	<div class="caption">
                 		       	<p class="p">
                       		 	<a class="pro-name" href="/program/programdetail.jsp?pno=<%=program.getProgramNo()%>">[<%=program.getProgramName()%>]</a><br />
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
            <!--/Slider-->
        </div>

    </div>
</div>
<%@ include file="../common/footer.jsp"%>
</div>
</body>
<script type="text/javascript">

</script>
</html>