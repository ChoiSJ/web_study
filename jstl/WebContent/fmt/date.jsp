<%@page import="java.util.Date"%>
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
	request.setAttribute("today", new Date());
%>
<div class="container">
	<h1>fmt 태그 라이브러리의 formatDate</h1>
	
	<p><fmt:formatDate value="${today }"/></p>
	<p><fmt:formatDate value="${today }" type="date"/></p>
	<p><fmt:formatDate value="${today }" type="time"/></p>
	<p><fmt:formatDate value="${today }" type="both"/></p>
	<p><fmt:formatDate value="${today }" pattern="yyyy.MM.dd"/></p>
	<p><fmt:formatDate value="${today }" pattern="yyyy년 M월 d일 EEEE"/></p>
	<p><fmt:formatDate value="${today }" pattern="yyyy년 M월 d일 EEEE a"/></p>
	<p><fmt:formatDate value="${today }" pattern="yyyy년 M월 d일 EEEE a hh:mm:ss"/></p>
</div>
</body>
</html>