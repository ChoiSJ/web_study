<%@page import="vo.ItemVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ItemDAO"%>
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
<title>sample</title>
</head>
<body>
<div class="container">
	<h1>상품 리스트</h1>
	
	<table class="table table-striped">
		<thead>
			<tr>
				<th>제품번호</th>
				<th>제품이름</th>
				<th>제조사</th>
				<th>가격</th>
				<th>생산일</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
	<% 
		ItemDAO dao = new ItemDAO();
		ArrayList<ItemVO> items = dao.getAllItems();
		
		for (ItemVO item : items) {
	%>
			<tr>
				<td><%=item.getNo() %></td>
				<td><%=item.getName() %></td>
				<td><%=item.getMaker() %></td>
				<td><%=item.getPrice() %></td>
				<td><%=item.getPubdate() %></td>
				<td><a href="addcart.jsp?ino=<%=item.getNo()%>">장바구니 담기</a></td>
			</tr>
	<%		
		}
	%>		
		</tbody>
	</table>
	<p>
		<a href="main.jsp">홈으로 가기</a>
		<a href="cart.jsp">장바구니 보기</a>
	</p>
</div>
</body>
</html>