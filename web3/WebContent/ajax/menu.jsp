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
	<h1>TV에 나올 맛집</h1>
	종류: <select id="kind-box" onchange="getMenu()">
			<option value=""> -- 선택하세요 -- </option>
			<option value="kr">한식</option>
			<option value="ch">중식</option>
			<option value="jp">일식</option>
	</select>
		
	메뉴: <select id="menu-box">
			<option>종류를 먼저 선택하세요.</option>
	</select>
</div>
</body>
<script type="text/javascript">
	function getMenu() {
		// 선택된 종류 가져오기
		var kind = document.getElementById("kind-box").value;
		
		if (kind) {
			// XHR 생성하기
			var xhr = new XMLHttpRequest();
			
			// XHR 에 콜백함수 등록하기
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					// 서버가 보낸 응답데이터 처리하기
					var data = xhr.responseText;
					var menuItems = data.split(",");	// 배열로 만든다
					
					var htmlContent = "";
					
					for (var i=0; i<menuItems.length; i++) {
						htmlContent += "<option>"+menuItems[i]+"</option>";
					}
					
					document.getElementById("menu-box").innerHTML = htmlContent;
				}
			}
			
			// XHR 초기화하기
			xhr.open("GET", "menuitem.jsp?kind=" + kind);
			
			// XHR 전송하기
			xhr.send(null);
		}
	}
</script>
</html>