<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="vo.noticeReVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.UserVO"%>
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
<title>Sample</title>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%
			int pageNo = Integer.parseInt(request.getParameter("pno"));
			int no = Integer.parseInt(request.getParameter("no"));
			noticeDAO dao = new noticeDAO();
			dao.addcount(no);
			int reCount = dao.noticeReCount(no);
			noticeVO vo = dao.getBlogByNo(no);
	%>
<div class="container-fluid main-container" style="padding-left: 0; padding-right: 0;">		
	<div class="container">
	<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h2><strong>공지사항</strong></h2>
		</div>

	
	<div class="panel-body">
		<table class="table">	
				<thead>
				<tr>
					<td colspan="2">
						<p class="text-left"><strong style="font-size: 150%;"><%=vo.getTitle() %></strong></p>
						<p class="text-left"><font style="font-size: 90%;"><%=vo.getWriter() %> | 작성일: <%=vo.getRegdate() %> | 조회수: <%=vo.getCount() %></font></p>
					</td>
				</tr>
				</thead>
				<tr>
					<td>
					<p style="padding-top: 10px; padding-bottom: 50px;">
					<%=vo.getContent().replaceAll("\n", "<br/>") %>
					</p>
					</td>
				</tr>
					<%
					ArrayList<noticeReVO> revo = dao.getNoticeReList(no);
					for(noticeReVO reply: revo){
					%>
				<tr class="active">
					<td>
						<p class="text-left"><%=reply.getUserName() %> | <%=reply.getRegdate() %></p>
						<p class="text-left"><%=reply.getContent().replaceAll("\n", "<br/>") %></p>
					</td>
					<td>
						<% 
							if(user != null){
								if(reply.getUserId().equals(user.getUserId()) || "admin1234".equals(user.getUserId())){		
						%>
						<form method="post" action="noticeReplyDel.jsp">
								<div class="text-right">
									<input type="hidden" name="replyNo" value="<%=reply.getRno() %>">
									<input type="hidden" name="pageno" value="<%=pageNo %>">
									<input type="hidden" name="noticeno" value="<%=no %>">
									<button type="submit" class="btn btn-default btn-xs">삭제</button>
								</div>
						</form>
						<%
								}
							}
						%>	
					</td>
				</tr>
				<%} %>
				<tr>
					<td colspan="2">
					<form method="post" action="noticeReregister.jsp" onsubmit="return checkRe();">
				<%
					if (user != null && "admin1234".equals(user.getUserId())) {
				%>
					<p class="text-left">한줄 댓글(<%=reCount %>) | <%=user.getUserId() %> | <%=user.getUserName() %></p>
				<%
					}else{
				%>
					<p class="text-left">한줄 댓글(<%=reCount %>) | </p>
				<%
					}
				%>
				<% 
					if (user != null) {
				%>
					<div class="text-right">
						<input type="hidden" name="userid" value="<%=user.getUserId() %>">
						<input type="hidden" name="username" value="<%=user.getUserName() %>">
						<input type="hidden" name="noticeno" value="<%=no %>">
						<input type="hidden" name="pageno" value="<%=pageNo %>">
						<input type="text" class="form-control" name="title" placeholder="댓글 입력." id="reply-input"/>
						<button type="submit" class="btn btn-success">등록</button>
					</div>
					
				<% 
				}else{	
				%>
					<div class="form-group">
						<input type="text" class="form-control" name="title" placeholder="로그인 후 이용 가능합니다." onclick="fn1()"/>
					</div>
				<%
				}
				%>
					</form>
					</td>
				</tr>
		</table>
	</div>	
	<div class="panel-footer text-right">
		<a href="noticeList.jsp" class="btn btn-info">목록</a>
	</div>
	</div>
	</div>
</div>
<%@ include file="../common/footer.jsp"%>
</div>
</body>
<script type="text/javascript">
function fn1() {
	alert("로그인후 사용하세요");
	location.href="../account/login.jsp";
}

function checkRe(){
	var reply1 = document.getElementById("reply-input");
	var reply2 = reply1.value;
	if(reply2 ==""){
		alert("댓글을 입력하세요");
		return false;
	}
	return true;
}
</script>
</html>