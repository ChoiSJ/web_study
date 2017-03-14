<%@page import="vo.noticeVO"%>
<%@page import="dao.noticeDAO"%>
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
<title>Notice Modify</title>
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
			<form method="post" action="noticemodifyprocess.jsp">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>공지수정란</h4>
				</div>
				<div class="panel-body">
				<%
					int no = Integer.parseInt(request.getParameter("mno"));
					noticeDAO dao = new noticeDAO();
					noticeVO notice = dao.getBlogByNo(no);
				%>
					<div class="form-group">
						<label>제목</label>
						<input type="text" class="form-control" value="<%=notice.getTitle() %>" name="title"/>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea rows="5" class="form-control" name="content"><%=notice.getContent() %></textarea>
					</div>
					<div>
						<input type="hidden" class="form-controle" value="<%=notice.getNo() %>" name="mno"/>
					</div>
				</div>
				<div class="panel-footer" align="right">
					<button class="btn btn-default" type="submit">수정</button>
					<a href="adminNoticeList.jsp" class="btn btn-default">취소</a>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>