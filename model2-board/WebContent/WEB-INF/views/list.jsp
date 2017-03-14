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
<div class="container">
	<div class="row">
		<div class="col-sm-8 col-sm-offset-2">
			<h3 style="text-align: center;">게시물 리스트</h3>
			<table class="table table-striped table-bordered" style="margin-bottom: 0px;">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>등록일</th>
						<th>IP</th>
						<th>좋아요</th>
						<th>삭제</th>
					<tr>
				</thead>
				<tbody>
				<c:forEach var="board" items="${boardList }">
					<tr>
						<td>${board.no }</td>
						<td><a href="detail.hta?dno=${board.no }">${board.title }</a></td>
						<td>${board.writer }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" /></td>
						<td>${board.ip }</td>
						<td>
							<button class="btn btn-info" onclick="plusLikeCount(${board.no })">Like <span class="badge" id="likeCountNumber-${board.no }">${board.likes }</span></button>
						</td>
						<td><a href="del.hta?dno=${board.no }" class="btn btn-danger">삭제</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="well text-right" style="padding-top: 4px; padding-bottom: 9px;">
				<button onclick="location.href = 'form.hta'" class="btn btn-success">등록</button>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	function plusLikeCount(no) {
		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				var likeCountNumber = document.getElementById("likeCountNumber-" + no).textContent;
				document.getElementById("likeCountNumber-" + no).textContent = Number(likeCountNumber) + 1;
			}
		}
		
		xhttp.open("GET", "modifyLikeCount.hta?mno=" + no);
		xhttp.send();
	}
</script>
</html>