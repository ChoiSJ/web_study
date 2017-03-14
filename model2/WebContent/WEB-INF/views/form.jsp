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
</head>
<body>
	<div class="container">
		<h1>신규 고객 등록 폼</h1>
		<form method="post" action="add.hta">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" class="form-control" name="id">
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" class="form-control" name="pwd">
			</div>
			<div class="form-group">
				<label>이름</label>
				<input type="text" class="form-control" name="name">
			</div>
			<div class="form-group">
				<label>전화번호</label>
				<input type="text" class="form-control" name="phone">
			</div>
			<div class="form-group">
				<label>주소</label>
				<input type="text" class="form-control" name="addr">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-default">등록</button>
			</div>
		</form>
	</div>
</body>
</html>