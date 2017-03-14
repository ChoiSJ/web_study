<%@page import="dao.FreeDAO"%>
<%@page import="vo.FreeVO"%>
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
	// 한글처리를 위한 인코딩 설정
		request.setCharacterEncoding("utf-8");
		int freeNo = Integer.parseInt(request.getParameter("tno"));
		int pageNo = Integer.parseInt(request.getParameter("currentPage"));
		
		FreeDAO dao = new FreeDAO();
		
		FreeVO vo = dao.getFreeByNo(freeNo);
	%>
	<div class="container">
		<div class="col-md-12">
			<form method="post" action="modify.jsp" onsubmit="return check();">
				<div class="panel panel-info">
					<div class="panel-heading" style="font-size: 150%">
						글수정
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label>제목</label>
							<input name="title" type="text" class="form-control" id="free-title" value="<%=(vo.getTitle())%>">
							<div id="empty-title"></div>
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="description" rows="5" class="form-control" id="free-content"><%=(vo.getContent()) %></textarea>
							<div id="empty-content"></div>
						</div>
					</div>
					<div class="panel-footer text-right">
						<button type="submit" class="btn btn-info">수정하기	</button>
						<a href="freelist.jsp" class="btn btn-default">취소</a>
						<input type="hidden" name="no" value="<%=(vo.getNo())%>">
						<input type="hidden" name="gno" value="<%=(vo.getGno())%>">
						<input type="hidden" name="pno" value="<%=pageNo%>">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	function check() { 
		var title = document.getElementById("free-title");
		var titleValue = title.value.trim();
		var emptyTitle = document.getElementById('empty-title');
		if (titleValue == "") {
			emptyTitle.innerHTML = '<font color="red">제목을 입력해주세요.</font>';
			title.value = "";
			title.focus();
			return false;
		}
		var content = document.getElementById("free-content");
		var contentValue = content.value.trim();
		var emptyContent = document.getElementById('empty-content');
		if (contentValue == "") {
			emptyContent.innerHTML = '<font color="red">내용을 입력해주세요.</font>';
			content.value = "";
			content.focus();
			return false;
		}
		return true;
	}
</script>
</html>