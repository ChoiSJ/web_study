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
<script type="text/javascript">
$(function() {
	$("button").click(function() {
		$.ajax({
			type: "GET",
			url: "../getData",
			dataType: "jsonp",
			jsonp: "callback",	// 콜백메소드의 이름을 지정한다.
			success: function(data) {
				alert(JSON.stringify(data));
			}
		});
	});
})
</script>
</head>
<body>
<div>
	<h1>사원 정보</h1>
	<div><button>조회하기</button></div>
	<div id="view-box"></div>
</div>
</body>
</html>