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
<title>Todo Application</title>
</head>
<body>
	<%@ include file="common/head.jsp" %>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-3 well">
				<h3>일정 등록 폼</h3>
				<form method="post" enctype="application/x-www-form-urlencoded" action="register.jsp">
					<div class="form-group">
						<label>종류</label>
						<input type="text" class="form-control" name="category" />
					</div>
					<div class="form-group">
						<label>제목</label>
						<input type="text" class="form-control" name="title" />
					</div>
					<div class="form-group">
						<label>내용</label>
						<input type="text" class="form-control" name="description" />
					</div>
					<div class="form-group">
						<label>장소</label>
						<input type="text" class="form-control" name="location" />
					</div>
					<div class="form-group">
						<label>일시</label>
						<input type="date" class="form-control" name="day" />
					</div>
					<div class="form-group text-right">
						<button type="submit" class="btn btn-primary">등록</button>
						<a href="registerform.jsp" class="btn btn-default">취소</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>