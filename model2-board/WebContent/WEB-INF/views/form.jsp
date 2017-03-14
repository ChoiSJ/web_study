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
	<div class="row">
		<h3 style="text-align: center;">게시물 등록</h3>
		<div class="col-sm-6 col-sm-offset-3 well">
			<form method="post" action="add.hta" style="text-align: right;">
				<div class="form-group" style="text-align: left;">
					<label>제목</label>
					<input class="form-control" type="text" name="title" placeholder="제목을 입력하세요.">
				</div>
				<div class="form-group" style="text-align: left;">
					<label>글쓴이</label>
					<input class="form-control" type="text" name="writer" placeholder="글쓴이를 입력하세요.">
				</div>
				<div class="form-group" style="text-align: left;">
					<label>내용</label>
					<textarea class="form-control" rows="5" name="contents" placeholder="내용을 입력하세요."></textarea>
				</div>
				<button class="btn btn-success" type="submit">등록</button>
				<button class="btn btn-default" onclick="history.back()">취소</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>