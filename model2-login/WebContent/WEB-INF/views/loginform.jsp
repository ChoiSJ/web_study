<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h1>로그인 폼</h1>
			
		<c:if test="${param.err eq 'fail' }">
			<div class="alert alert-danger">
				<strong>로그인 실패</strong> 아이디 혹은 비밀번호가 올바르지 않습니다.
			</div>
		</c:if>
		
		<c:if test="${param.err eq 'deny' }">
			<div class="alert alert-danger">
				<strong>접속 거부</strong> 로그인한 사용자만 접속할 수 있는 페이지입니다.
			</div>
		</c:if>
		
		<form method="post" action="login.hta" class="well">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" class="form-control" name="userid">
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" class="form-control" name="userpwd">
			</div>
			<div class="form-group">
				<button class="btn btn-default">로그인</button>
			</div>
		</form>
	</div>
</body>
</html>