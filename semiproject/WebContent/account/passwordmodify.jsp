<%@page import="dao.UserDAO"%>
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
<title>비밀번호변경</title>
<style type="text/css">
	.container {
		padding-top: 50px;
	}
</style>
</head>
<body>
<%@ include file="/common/header.jsp"%>
<%
	if (user == null) {
		response.sendRedirect("/account/login.jsp");
		return;
	}
%>

<div class="container">
	<div class="col-sm-4 col-sm-offset-4">
		<form method="post" action="passwordmodifyprocess.jsp" onsubmit="return formcheck();">
			<div class="panel panel-info">
				<div class="panel-heading">비밀번호변경</div>
				<div class="panel-body">
				<%
					UserDAO dao = new UserDAO();
					UserVO vo = dao.getUserByNo(user.getUserNo());
				%>
					<div class="form-group">
						<label>기존 비밀번호</label>
						<input type="password" class="form-control" name="oldpwd" id="oldpwd"/>
						<input type="hidden" class="form-control" name="hiddenpwd" id="hiddenpwd" value="<%=vo.getUserPwd() %>"/>
					</div>
					<div class="form-group">
						<label>새 비밀번호</label>
						<input type="password" class="form-control" name="newpwd" id="newpwd"/>
					</div>
					<div class="form-group">
						<label>새 비밀번호 확인</label>
						<input type="password" class="form-control" name="chknewpwd" id="chknewpwd"/>
					</div>
						<input type="hidden" class="form-control" name="id" id="user-id" value="<%=vo.getUserId() %>"/>
				</div>
				<div class="panel-footer text-right">
					<button type="submit" class="btn btn-success">완료</button>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
<script type="text/javascript">
	function formcheck() {
		var pwdEL = document.getElementById("oldpwd");
		var pwd = pwdEL.value.trim();
		if (pwd == "") {
			alert("기존 비밀번호를 입력해주세요.");
			pwdEL.focus();
			return false;
		}
		
		var patternPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}/;
		if (!patternPwd.test(pwd)) {
			alert("비밀번호는 8글자 이상, 하나 이상의 대문자, 소문자, 숫자, 특수문자를 포함해야 합니다.");
			pwdEL.focus();
			return false;
		}
		
		var pwdEL = document.getElementById("newpwd");
		var pwd = pwdEL.value.trim();
		if (pwd == "") {
			alert("새 비밀번호를 입력해주세요.");
			pwdEL.focus();
			return false;
		}
		
		var patternPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}/;
		if (!patternPwd.test(pwd)) {
			alert("비밀번호는 8글자 이상, 하나 이상의 대문자, 소문자, 숫자, 특수문자를 포함해야 합니다.");
			pwdEL.focus();
			return false;
		}
		
		var pwdEL = document.getElementById("chknewpwd");
		var pwd = pwdEL.value.trim();
		if (pwd == "") {
			alert("새 비밀번호를 한번 더 입력해주세요.");
			pwdEL.focus();
			return false;
		}
		
		var patternPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}/;
		if (!patternPwd.test(pwd)) {
			alert("비밀번호는 8글자 이상, 하나 이상의 대문자, 소문자, 숫자, 특수문자를 포함해야 합니다.");
			pwdEL.focus();
			return false;
		}
	}
</script>
</html>