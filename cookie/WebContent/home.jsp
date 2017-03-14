<%@page import="util.CookieUtil"%>
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
	<div class="row">
		<div class="col-sm-8">
			<h2>새 상품</h2>
			<ul class="list-group">
				<li class="list-group-item"><a href="product.jsp?name=macbook">macbook</a></li>
				<li class="list-group-item"><a href="product.jsp?name=ipad">ipad</a></li>
				<li class="list-group-item"><a href="product.jsp?name=iphone7">iphone7</a></li>
				<li class="list-group-item"><a href="product.jsp?name=galaxynote">galaxynote</a></li>
				<li class="list-group-item"><a href="product.jsp?name=v20">v20</a></li>
				<li class="list-group-item"><a href="product.jsp?name=crema">crema</a></li>
			</ul>
		</div>
		<div class="col-sm-4">
			<h2>최근 본 상품</h2>
			<ul class="list-group">
		<%
			Cookie[] cookies = request.getCookies();
			String cookieValue = CookieUtil.getValue(cookies, "recent-product");
			String[] valueArr = cookieValue.split(":");
			
			for (String value : valueArr) {
		%>
				<li class="list-group-item" style="background-color: #98FB98;"><%=value %></li>
		<%			
			}
		%>
		
			</ul>
		</div>
	</div>
</div>
</body>
</html>