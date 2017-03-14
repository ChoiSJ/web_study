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
		<h1>상품 리스트</h1>
		
		<% 
			String pno = request.getParameter("pno");
		%>
		<p>현재 페이지: <%=pno %></p>
		<p>현재 페이지: ${param.pno }</p>
		
		<ul class="pagination">
			<li><a href="demo.jsp?pno=1">1</a></li>
			<li><a href="demo.jsp?pno=2">2</a></li>
			<li><a href="demo.jsp?pno=3">3</a></li>
			<li><a href="demo.jsp?pno=4">4</a></li>
			<li><a href="demo.jsp?pno=5">5</a></li>
		</ul>
		
		<form method="post" action="demo2.jsp">
			검색어: <input type="text" name="keyword">
			<button type="submit" class="btn btn-default">검색</button>
		</form>
	</div>
</body>
</html>