<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<%
	request.setAttribute("balance", 1000000000.236);
%>
<div class="container">
	<h1>fmt 태그 라이브러리의 formatNumber 태그</h1>
	
	<p>잔액: <fmt:formatNumber value="${balance }"/></p>
	<p>잔액: <fmt:formatNumber value="${balance }" type="number"/></p>
	<p>잔액: <fmt:formatNumber value="${balance }" type="currency"/></p>
	
	<p>잔액: <fmt:formatNumber value="${balance }" pattern="#,###"/></p>
	<p>잔액: <fmt:formatNumber value="${balance }" pattern="#,###.##"/></p>
	<p>잔액: <fmt:formatNumber value="${balance }" pattern="#,###.00"/></p>
</div>
</body>
</html>