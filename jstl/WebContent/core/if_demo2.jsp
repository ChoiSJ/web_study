<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<h1>Core 태그 라이브러리의 if 태그</h1>
	
	<p>취득 점수: ${score }</p>
	
	<c:if test="${score ge 95 }" scope="request" var="a">
		<p>장학금 지급 대상입니다.</p>	
	</c:if>
	
	<c:if test="${score lt 95 }">
		<p>장학금 지급 대상이 아닙니다.</p>
	</c:if>
	<hr>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>제목</th>
				<th>저자</th>
				<th>출판사</th>
				<th>가격</th>
				<th>구매가격</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${book1.title }</td>
				<td>${book1.author }</td>
				<td>${book1.publisher }</td>
				<td><fmt:formatNumber value="${book1.price }" type="number"/> 원</td>
				<td>
					<c:if test="${book1.price >= 50000 }">
						<fmt:formatNumber value="${book1.price }" type="number"/> 원
					</c:if>
					<c:if test="${book1.price < 50000 }">
						<fmt:formatNumber value="${book1.price + 2500 }" type="number"/> 원
					</c:if>
				</td>
			</tr>
			<tr>
				<td>${book2.title }</td>
				<td>${book2.author }</td>
				<td>${book2.publisher }</td>
				<td><fmt:formatNumber value="${book2.price }" type="number"/> 원</td>
				<td>
					<c:if test="${book2.price >= 50000 }">
						<fmt:formatNumber value="${book2.price }" type="number"/> 원
					</c:if>
					<c:if test="${book2.price < 50000 }">
						<fmt:formatNumber value="${book2.price }" type="number"/> 원
					</c:if>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>