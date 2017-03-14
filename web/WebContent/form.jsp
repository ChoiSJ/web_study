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
<title>sample</title>
<style type="text/css">
	div#wrapper {width: 300px; margin-left: 15px}
	label {display: inline-block; width: 120px;}
</style>
</head>
<body>
<div id="wrapper">
	<h1>회원 가입 폼</h1>
	<form method="post" action="register.jsp">
		<p><label>아이디</label><input type="text" name="id"></p>
		<p><label>비밀번호</label><input type="password" name="pwd"></p>
		<p><label>이름</label><input type="text" name="name"></p>
		<p><label>전화번호</label><input type="text" name="phone"></p>
		<p><label>주소</label><input type="text" name="addr"></p>
		<p style="text-align: right;"><button>등록</button></p>
	</form>
</div>
</body>
</html>