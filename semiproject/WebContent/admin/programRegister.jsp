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
<title>Program Register</title>
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
		<div class="col-sm-6 col-sm-offset-3">
			<form method="post" enctype="multipart/form-data" action="../upload">
			<div class="panel panel-default">
				<div class="panel-heading">공연등록</div>
				<div class="panel-body">
					<div class="form-group">
						<label>공연명</label>
						<input type="text" class="form-control" name="programname"/>
					</div>
					<div class="form-group">
						<label>공연설명</label>
						<textarea rows="5" class="form-control" name="programdescription"></textarea>
					</div>
					<div class="form-group">
						<label>아티스트명</label>
						<input type="text" class="form-control" name="programartist"/>
					</div>
					<div class="form-group">
						<label>공연이미지</label>
						<input type="file" class="form-control" name="photofile"/>
					</div>
					<div class="form-group">
						<label>공연일</label>
						<input type="date" class="form-control" name="programdate"/>
					</div>
					<div class="form-group">
						<label>관객수</label>
						<input type="number" class="form-control" name="crowdnumber"/>
					</div>
					<div class="form-group">
						<label>발표일</label>
						<input type="date" class="form-control" name="announcedate"/>
					</div>
				</div>
				<div class="panel-footer" align="right">
					<button type="submit" class="btn btn-default">등록</button>
					<a href="/admin/adminMain.jsp" class="btn btn-default">취소</a>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>