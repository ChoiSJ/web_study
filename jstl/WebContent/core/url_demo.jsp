<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h1>Core 태그 라이브러리 url 태그</h1>
		
		<c:url var="listUrl" value="list.hta">
			<c:param name="pno" value="23"/>
			<c:param name="cat" value="notice"/>
			<c:param name="bno" value="5"/>
		</c:url>
		
		<p><a href="${listUrl }">목록</a></p>
		<p><a href="list.jsp?pno=23&cat=notice&bno=5">목록</a></p>
	</div>
</body>
</html>