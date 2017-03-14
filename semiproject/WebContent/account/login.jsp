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
<title>로그인</title>
<style type="text/css">
	.container {
		padding-top: 50px;
	}
</style>
</head>
<body>
<%@ include file="/common/header.jsp"%>

<div class="container">
	<div class="col-sm-4 col-sm-offset-4">
		<form method="post" action="loginprocess.jsp">
			<div class="panel panel-info">
				<div class="panel-heading">로그인</div>
				<div class="panel-body">
					<div class="form-group">
						<label>아이디</label>
						<input type="text" class="form-control" name="id"/>
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" class="form-control" name="pwd"/>
					</div>
				</div>
				<div class="panel-footer">
					<a href="signup.jsp" class="btn btn-default">회원가입</a>
					<button type="submit" class="btn btn-primary pull-right">로그인</button>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>