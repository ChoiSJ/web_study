<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<body>
	<c:set var="files" value="메모.txt,자기소개.ppt,이력서.doc"></c:set>
	<c:set var="productName" value="galaxy 7"></c:set>
	<c:set var="email" value="choi@gmail.com"></c:set>
	
	<p>상품명: ${fn:toUpperCase(productName) }</p>
	<p>상품명: ${fn:toLowerCase(productName) }</p>
	
	<p>계정명: ${fn:substring(email, 0, fn:indexOf(email, "@")) }</p>
	<p>계정명: ${fn:substringBefore(email, "@") }</p>
	<p>호스트명: ${fn:substringAfter(email, "@") }</p>
	
	<c:forEach var="filename" items="${fn:split(files, ',') }">
		<p>
			<c:choose>
				<c:when test="${fn:endsWith(filename, 'txt') }">
					${filename } <i class="fa fa-file-text"></i>
				</c:when>
				<c:when test="${fn:endsWith(filename, 'ppt') }">
					${filename } <i class="fa fa-file-powerpoint-o"></i>
				</c:when>
				<c:when test="${fn:endsWith(filename, 'doc') }">
					${filename } <i class="fa fa-file-word-o"></i>
				</c:when>
			</c:choose>
		</p>
	</c:forEach>
</body>
</html>