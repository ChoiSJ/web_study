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
<style type="text/css">
	.form-group {
		text-align: left;
	}
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<h3 style="text-align: center;">게시글 조회</h3>
		<div class="col-sm-6 col-sm-offset-3 well" style="text-align: right;">
			<div class="form-group">
				<label>제목</label>
				<input type="text" class="form-control" readonly="readonly" name="title" value="${board.title }">
			</div>
			<div class="form-group">
				<label>글쓴이</label>
				<input type="text" class="form-control" readonly="readonly" name="writer" value="${board.writer }">
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea rows="5" class="form-control" readonly="readonly" name="contents">${board.contents }</textarea>
			</div>
			<div class="form-group">
				<label>날짜</label>
				<input type="date" class="form-control" readonly="readonly" name="regdate" value="${regdate }">
			</div>
			<a class="btn btn-info" href="modifyform.hta?mno=${board.no }">수정</a>
			<button class="btn btn-default" onclick="history.back()">돌아가기</button>
		</div>
	</div>
</div>
</body>
</html>