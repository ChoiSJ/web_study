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
<title>회원가입</title>
<style type="text/css">
	.container {
		padding-top: 50px;
	}
</style>
</head>
<body>
<%@ include file="/common/header.jsp"%>
	
<div class="container">
	<div class="col-sm-6 col-sm-offset-3">
		<form method="post" action="signupprocess.jsp" onsubmit="return formcheck();">
			<div class="panel panel-info">
				<div class="panel-heading">회원가입</div>
				<div class="panel-body">
					<div class="form-group">
						<label>아이디</label>
						<input type="text" class="form-control" name="id" id="user-id"/>
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" class="form-control" name="pwd" id="user-pwd"/>
					</div>
					<div class="form-group">
						<label>이름</label>
						<input type="text" class="form-control" name="name" id="user-name"/>
					</div>
					<div class="form-group">
						<label>생일</label>
						<input type="date" class="form-control" name="birth" id="user-birth"/>
					</div>
					<div class="form-group">
						<label>전화번호</label>
						<input type="text" class="form-control" name="tel" id="user-tel"/>
					</div>
				</div>
				<div class="panel-footer text-right">
					<input type="submit" class="btn btn-primary" value="회원가입">
				</div>
			</div>
		</form>
	</div>
</div>
</body>
<script type="text/javascript">
	function formcheck() {
		var idEL = document.getElementById("user-id");
		var id = idEL.value.trim();
		if (id == "") {
			alert("아이디를 입력해주세요.");
			idEL.focus();
			return false;
		}
		
		var patternId = /^[a-zA-Z][a-zA-Z0-9]{5,11}$/;
		if (!patternId.test(id)) {
			alert("아이디는 6~12자의 영문자, 숫자만 사용 가능합니다.");
			idEL.focus();
			return false;
		}
		
		var pwdEL = document.getElementById("user-pwd");
		var pwd = pwdEL.value.trim();
		if (pwd == "") {
			alert("비밀번호를 입력해주세요.");
			pwdEL.focus();
			return false;
		}
		
		var patternPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}/;
		if (!patternPwd.test(pwd)) {
			alert("비밀번호는 8글자 이상, 하나 이상의 대문자, 소문자, 숫자, 특수문자를 포함해야 합니다.");
			pwdEL.focus();
			return false;
		}
		
		var nameEL = document.getElementById("user-name");
		var name = nameEL.value.trim();
		if (name == "") {
			alert("이름을 입력해주세요.");
			nameEL.focus();
			return false;
		}
		
		var patternName = /^[가-힣]{2,}$/;
		if (!patternName.test(name)) {
			alert("이름은 두글자이상 입력해주세요.");
			nameEL.focus();
			return false;
		}
		
		var birthEL = document.getElementById("user-birth");
		var birth = birthEL.value.trim();
		if (birth == "") {
			alert("생일을 입력해주세요.");
			birthEL.focus();
			return false;
		}
		
		var telEL = document.getElementById("user-tel");
		var tel = telEL.value.trim();
		var patternTel = /^01[016789]-\d{3,4}-\d{4}$/;
		if (!patternTel.test(tel)) {
			alert("유효한 전화번호 형식이 아닙니다.");
			telEL.focus();
			return false;
		}

		return true;
	}
</script>
</html>