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
	<h1>제품 상세정보</h1>
	<%
		String productName = request.getParameter("name");
	
		Cookie[] cookies = request.getCookies();
		String cookieValue = CookieUtil.getValue(cookies, "recent-product");
		
		if (cookieValue.isEmpty()) {
			cookieValue = productName;
		} else {
			cookieValue += ":" + productName;
		}
		
		Cookie cookie = new Cookie("recent-product", cookieValue);
		cookie.setMaxAge(60*60);
		response.addCookie(cookie);
	%>
	<p>제품명: <%=productName %></p>
	<p>제조사: 홍진호주식회사</p>
	<p>제조국: 한국</p>
	<p>제조날짜: 2022.02.22</p>
	
	<p><a href="home.jsp">홈으로 가기</a></p>
</div>
</body>
</html>