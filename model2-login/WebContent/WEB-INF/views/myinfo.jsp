<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
	<h1>내 정보</h1>
	<table class="table table-bordered table-striped">
		<tr>
			<th>아이디</th>
			<td>${LOGINED_USER.id }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${LOGINED_USER.name }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${LOGINED_USER.phone }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${LOGINED_USER.addr }</td>
		</tr>
	</table>
</div>
</body>
</html>