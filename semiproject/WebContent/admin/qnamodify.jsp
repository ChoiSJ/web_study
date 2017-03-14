<%@page import="vo.QnaReplyVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.QnaVO"%>
<%@page import="dao.QnaDAO"%>
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
<title>QnA Modify</title>
<style type="text/css">
	.container {
		padding-top: 50px
	}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>

<%
	if (user == null || !"admin1234".equals(user.getUserId())) {
		response.sendRedirect("/main.jsp");
		return;
	}
%>

<div class="container">
	<div class="row">
		<div class="col-sm-8 col-sm-offset-2">
			<form method="post" action="qnamodifyprocess.jsp" onsubmit="replyNumberSubmit()">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>QnA게시판 수정란</h4>
				</div>
				<div class="panel-body">
				<%
					int no = Integer.parseInt(request.getParameter("mno"));
					QnaDAO dao = new QnaDAO();
					QnaVO qna = dao.getQnaByNo(no);
				%>
					<div class="form-group">
						<label>제목</label>
						<input type="text" class="form-control" value="<%=qna.getTitle() %>" name="title"/>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea rows="5" class="form-control" name="content"><%=qna.getContent() %></textarea>
					</div>
					<div class="form-group">
						<label>작성자</label>
						<input type="text" class="form-control" value=<%=qna.getWriter() %> name="writer" readonly="readonly"/>
					</div>
					<div id="hidden-submit">
						<input type="hidden" class="form-control" value="<%=qna.getNo() %>" name="mno"/>
					</div>
				</div>
				<div class="panel-footer" align="right">
					<button class="btn btn-default" type="submit" value="">저장</button>
					<a href="adminqnalist.jsp" class="btn btn-default">취소</a>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	function deleteConfirm(rno, gno) {
		var isConfirm = window.confirm("삭제하시겠습니까?");
		var html = "";
		
		if (isConfirm) {
			var buttonDelete = document.getElementById("delete-free-"+rno+"");
			html += "deletefreerelpyprocess.jsp?dno="+rno+"&mno="+gno+"";
			buttonDelete.setAttribute("href", html);
		}
	}
	
	var index = 0;
	var rnoArr = [];
	
	function dangerReply(rno) {
		var replyId = document.getElementById("reply-"+rno+"");
		var value = replyId.innerHTML;
		var danger = "";
		
		if (value.includes("블라인드")) {
			return false
		} else {
			danger = "<strong style='color: Aqua'>블라인드 처리: </strong>"+value+"";	
		}
		
		replyId.innerHTML = danger;
		rnoArr[index] = rno;
		index++;
	}
	
	function replyNumberSubmit() {
		var hiddenSubmit = document.getElementById("hidden-submit");
		var html = "";
		
		for (var i=0; i<rnoArr.length; i++) {
			var rno = rnoArr[i];		
			
			html = "<input type='hidden' class='form-control' value='"+rno+"' name='rno'/>"
			hiddenSubmit.innerHTML += html;
		}
	}
</script>
</html>