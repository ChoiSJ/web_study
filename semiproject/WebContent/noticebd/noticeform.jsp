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
<title>공지게시판 | 스페이스공감 - 교육의 중심 EBS</title>
<style type="text/css">
	.container {
		padding-top: 50px; 
	}
</style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<%
	if(user == null){
		response.sendRedirect("/account/login.jsp");
	} else if ("admin1234".equals(user.getUserId())) {		
%>
<div class="container">
	<form method="post" action="noticeregister.jsp" onsubmit="return checkform();">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>새로운 공지글 등록</h4>
						<div class="form-group">
							<label>제목</label>
							<input type="text" class="form-control" name="title" id="text-tit"/>
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea rows="5" class="form-control" name="content" id="text-con"></textarea>
						</div>
						<div class="form-group">
							<input type="radio" name="impchk" id="imp_chk" checked="checked"class="form-group" value="n"/><span class="up">일반공지</span>&nbsp;&nbsp;
							<input type="radio" name="impchk" id="imp_chk"class="form-group" value="y"/><span class="up">중요공지</span>&nbsp;&nbsp;
						</div>
						<div class="form-group">
							<input type="hidden" class="form-control" name="writer" value="<%=user.getUserId() %>"/>
							<button type="submit" class="btn btn-success">등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<% 
} else {
	response.sendRedirect("main.jsp");
}
%>
</body>
<script type="text/javascript">
function checkform(){	
	var title = document.getElementById("text-tit");
	var title1 = title.value;
	var content = document.getElementById("text-con");
	var content1 = content.value;
		
	if(title1 == ""){
		alert("제목을 입력하세요");
		return false;			
	}
	
	if(content1 ==""){
		alert("내용을 입력하세요");
		return false;
	}
	
	return true;
}
</script>
</html>