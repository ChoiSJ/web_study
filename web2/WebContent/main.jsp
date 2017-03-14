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
	<%@ include file="common/navi.jsp" %>
	
	<div class="container">
		<h1>메인 페이지</h1>
		
		<!-- 컨텐츠 영역 -->
		<div class="row">
			<p>메인 페이지의 주요 컨텐츠</p>
		</div>
		
		<!-- 바닥글 영역 -->
		<%@ include file="common/footer.jsp" %>
	</div>
</body>
</html>