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
<title>글쓰기</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%
	// 세션객체를 찾을 수 없는 경우
	if (session == null) {
		response.sendRedirect("../account/login.jsp?err=fail");
		return;
	}
	// 세션객체에서 "LOGIN_USER"라는 이름으로 저장된 객체찾기
	if (user == null) {
		response.sendRedirect("../account/login.jsp?err=fail");
		return;
	}
	%>
<div class="container-fluid main-container" style="padding-left: 0; padding-right: 0;">	
	<div class="container">
		<div class="col-md-12">
			<form method="post" action="register.jsp" onsubmit="return check();">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2><strong>질문등록</strong></h2>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label>제목</label>
							<input name="title" type="text" class="form-control" id="qna-title">
							<div id="empty-title"></div>
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="description" rows="5" class="form-control" id="qna-content"></textarea>
							<div id="empty-content"></div>
						</div>
					</div>
					<div class="panel-footer text-right">
						<button type="submit" class="btn btn-info">등록</button>
						<a href="qnalist.jsp" class="btn btn-default">취소</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- footer -->
	<br>
	<%@ include file="../common/footer.jsp"%> 
</div>
</body>
<script type="text/javascript">
	function check() { 
		
		var title = document.getElementById("qna-title");
		var titleValue = title.value.trim();
		var emptyTitle = document.getElementById('empty-title');
		
		var content = document.getElementById("qna-content");
		var contentValue = content.value.trim();
		var emptyContent = document.getElementById('empty-content');
		
		if (titleValue == "") {
			emptyTitle.innerHTML = '<font color="red">제목을 입력해주세요.</font>';
			title.value = "";
			title.focus();
			return false;
		} else {
			emptyTitle.innerHTML = '';
		} 
			
		if (title.value.length > 30) {
			emptyTitle.innerHTML = '<font color="red">제목은 최대 30자까지 입력가능합니다.</font>';
			title.focus();
			return false;
		} else	{
			emptyTitle.innerHTML = '';
		}
		
		if (contentValue == "") {
			emptyContent.innerHTML = '<font color="red">내용을 입력해주세요.</font>';
			content.value = "";
			content.focus();
			return false;
		} else {
			emptyContent.innerHTML = '';
		}
		
		if (content.value.length > 300) {
			emptyContent.innerHTML = '<font color="red">내용은 최대 300자까지 입력가능합니다.</font>';
			title.focus();
			return false;
		} else {
			emptyContent.innerHTML = '';
		}
		
		return true;
	}
</script>
</html>