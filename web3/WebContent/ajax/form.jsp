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
	<h1>회원 가입 폼</h1>
	<form method="post" action="register.jsp">
		<div class="form-group">
			<label>아이디</label>
			<input type="text" class="form-control" id="user-id" name="userid" onkeyup="duplicateCheck()">
			<div id="result-box"></div>
		</div>
		<div class="form-group">
			<label>이름</label>
			<input type="text" class="form-control" id="user-name" name="username">
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-default">가입</button>
		</div>
	</form>
</div>
</body>
<script type="text/javascript">
	function duplicateCheck() {
		var userId = document.getElementById("user-id").value;
		console.log("입력한 아이디:", userId);
		
		// 1. XHR 생성하기
		var xhr = new XMLHttpRequest();	// Chrome, IE7+, Safari, Opera
		
		// 4. XHR 에서 이벤트 발생시 실행될 콜백함수 등록하기
		xhr.onreadystatechange = function() {
			//console.log(xhr.readyState);
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = xhr.responseText;
				console.log("중복여부:", result);
				
				var box = document.getElementById("result-box");
				
				if (result == "Y") {
					box.innerHTML = "<p class='text-danger'>이미 사용중인 아이디입니다.</p>";
				} else if (result == "N") {
					box.innerHTML = "<p class='text-success'>사용가능한 아이디입니다.</p>";
				}
			}
		}
		
		// 2. XHR 에게 요청 URL 지정하기
		xhr.open("GET", "check.jsp?userid=" + userId);
		
		// 3. 서버에게 요청을 보내기
		xhr.send(null);
	}
</script>
</html>