<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<title>Program Modify</title>
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
			<form method="post" enctype="multipart/form-data" action="../processmodify">
			<div class="panel panel-default">
				<div class="panel-heading">공연수정</div>
				<div class="panel-body">
				<% 
					int no = Integer.parseInt(request.getParameter("pno"));
					ProgramDAO dao = new ProgramDAO();
					ProgramVO program = dao.getProgramByNo(no);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");					
				%>
					<div class="form-group">
						<label>공연명</label>
						<input type="text" class="form-control" name="programname" value="<%=program.getProgramName() %>"/>
					</div>
					<div class="form-group">
						<label>공연설명</label>
						<textarea rows="5" class="form-control" name="programdescription"><%=program.getProgramDescription().replace("<br>", "\n") %></textarea>
					</div>
					<div class="form-group">
						<label>아티스트명</label>
						<input type="text" class="form-control" name="artistname" value="<%=program.getArtistName() %>"/>
					</div>
					<div class="form-group">
						<label>공연이미지</label><br>
						<img id="image" alt="<%=program.getPhotofile() %>" src="..\photoGallery\<%=program.getPhotofile() %>" 
						width="320px" height="240px" style="margin-bottom: 10px;"/>
						<input id="upload-image" type="file" class="form-control" name="photofile" onchange="return uploadImage()"/>
						<input id="upload-image-hidden" type="hidden" class="form-control" name="photofile-hidden" value="<%=program.getPhotofile() %>"/>
					</div>
					<div class="form-group">
					<!-- 공연일 타입이 String 인데 input type 이 date 인 폼에 넣어도 값이 들어가므로 그대로 대입. 발표일도 같음. --> 
						<label>공연일</label>
						<input type="date" class="form-control" name="programdate" value="<%=program.getProgramDate() %>"/>
					</div>
					<div class="form-group">
						<label>관객수</label>
						<input type="number" class="form-control" name="crowdnumber" value="<%=program.getCrowdnumber() %>"/>
					</div>
					<div class="form-group">
						<label>발표일</label>
						<input type="date" class="form-control" name="announcedate" value="<%=program.getAnnounceDate() %>"/>
					</div>
					<hr>
					<div>
						<label>공개여부</label><br>
						공개 <input type="radio" name="isvisible" value="Yes" checked/>
						비공개 <input type="radio" name="isvisible" value="No"/>
					</div>
					<input type="hidden" name="program-no" value="<%=program.getProgramNo() %>"/>
				</div>
				<div class="panel-footer" align="right">
					<button type="submit" class="btn btn-default">수정</button>
					<a href="programmodifylist.jsp" class="btn btn-default">취소</a>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	function uploadImage() {
		var file = document.querySelector("input[type=file]").files[0];
		var reader = new FileReader();
		
		reader.addEventListener("load", function() {
			document.getElementById("image").src = reader.result;
		}, false);
		
		if (file) {
			reader.readAsDataURL(file);			
		}
		
		return true;
	}
</script>
</html>