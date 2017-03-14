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
<title>EBS 공감</title>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
<div class="container-fluid main-container" style="padding-left: 0; padding-right: 0;">	
	<div class="container">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
					<%
						int pageNo = Integer.parseInt(request.getParameter("pno"));
						int qnaNo = Integer.parseInt(request.getParameter("tno"));
						QnaDAO dao = new QnaDAO();
						QnaVO qna = dao.getQnaByNo(qnaNo);
						//QnaVO reply = dao.getQnaByGno(qna.getIsAnswer());

					%>
						<h2><strong>Q&amp;A</strong></h2>
					</div>
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr> 
									<td colspan="2">
										<strong style="font-size: 150%;"> <%=qna.getTitle() %> </strong>
										<br>
										<font style="font-size: 90%;">글쓴이: <%=qna.getWriter() %>  ｜  작성일: <%=qna.getRegdate() %>  ｜  조회수: <%=qna.getCount() %></font>
									</td>
								</tr>
							</thead>
							<tr>
								<!-- 본문 내용 시작 -->
								<td colspan="2">
									<p style="padding-top: 10px; padding-bottom: 50px;">
									<%if(qna.getContent()!=null){ %>
										<%=qna.getContent().replaceAll("\n", "<br/>") %><%} %>
										<%
											// 작성자와 로그인한 사용자가 같은경우 삭제, 수정버튼 생성
											if(isLogined==true){
											if(qna.getWriter().equals(user.getUserId())) { 
										
										%>
										<!-- 삭제, 수정버튼 시작 -->
										<div style="text-align: right;">
											<form method="post" style="display: inline-block;" action="qnamodify.jsp">
												<button type="submit" class="btn btn-warning btn-sm">수정</button>
												<input type="hidden" name="tno" value="<%=qna.getNo()%>">
												<input type="hidden" name="currentPage" value="<%=pageNo%>">
											</form> 
											<form method="post" style="display: inline-block;" action="deleteqna.jsp" onsubmit="return areYouSure();">
												<button type="submit" class="btn btn-danger btn-sm">삭제</button>
												<input type="hidden" name="tno" value="<%=qna.getNo()%>">
												<input type="hidden" name="currentPage" value="<%=pageNo%>">
											</form> 
										</div>
										<%}} %>
										<!-- 삭제, 수정 버튼 끝 -->
								</td>
								<!-- 본문 내용 끝 -->
							</tr>
							<!-- 댓글(답변) 출력 시작 -->
							<%
							QnaReplyVO vo = dao.getQnaReply(qna.getNo());
							%>
								<tr class="success">
									<td style="padding-bottom: 15px !important;">
										<% if(vo != null){ %>
										<span style="color: green; font-size: 130%; padding-left: 5px;"><strong>[답변]</strong></span>
										<span style="padding-left: 10px; font-style: italic; font-size: 90%"><%=vo.getRegdate() %></span>
										<div style="padding-top: 10px; padding-left: 10px !important;"><%=vo.getContent().replaceAll("\n", "<br/>") %></div>
										<%} else {%>
										<div style="padding-top: 5px; padding-left: 10px !important;">아직 답변이 등록되지 않았습니다.</div>
										<%} %>
									</td>
									<!-- 운영자일경우 댓글(답변) 수정, 삭제버튼 표시 -->
									<td>
										<%
										if(isLogined && vo != null){
											if("admin1234".equals(user.getUserId())){ %>
											<form method="post" action="replydelete.jsp">
											<div class="text-right">
												<button type="submit" class="btn btn-default btn-xs">삭제</button>
												<input type="hidden" name="tno" value="<%=vo.getNo()%>">
												<input type="hidden" name="localno" value="<%=vo.getLocalNo()%>">
												<input type="hidden" name="pno" value="<%=pageNo%>">
											</div>
											</form>
										<%	
											} 
										}
										%>
									</td>
								</tr>
							<!-- 댓글(답변) 출력 끝. -->

							<!-- 운영자일경우 답변등록폼 표시 -->
							<%if(isLogined){
								if("admin1234".equals(user.getUserId())){ %>
							<tr>
								<td colspan="2">
									<form method="post" action="reply.jsp" style="padding-left: 10px !important" onsubmit="return replycheck();">
										<div class="form-group">
											<label>답변 등록/수정</label>
											<textarea name="reply" id="reply-content" rows="5" class="form-control" placeholder="여기에 답변을 작성하세요"><%if(vo != null){ %><%=vo.getContent()%><%} %></textarea>
										</div>
										<div id="reply-warning"></div>
										<div class="text-right">
											<button type="submit" class="btn btn-success">등록</button>
											<input type="hidden" name="tno" value="<%=qnaNo%>">
											<input type="hidden" name="pno" value="<%=pageNo%>">
											<input type="hidden" name="pno" id="is-login" value="<%=isLogined%>">
										</div>
									</form>
								</td>
							</tr>
						<%		}
							}		%>
						</table>
					</div>
					<div class="panel-footer text-right">
						<a href="qnalist.jsp?pno=<%=pageNo %>" class="btn btn-success">목록</a>
				</div>
			</div>
		</div>
	</div>
	<br>
	<!-- footer -->
	<%@ include file="../common/footer.jsp"%> 
</div>
</body>
<script type="text/javascript">
	function areYouSure(){
		if(confirm("정말 삭제하시겠습니까?") == true)
			return true;
		return false;
	}
	function replycheck(){
		var islogin = document.getElementById("is-login");
		var isloginValue = islogin.value;
		if(isloginValue=='false'){
			if(confirm("로그인후 이용가능합니다. 확인시 로그인페이지로 이동합니다.") == true){
				location.href="../account/login.jsp";	
			}
			return false
		}
		var replyContent = document.getElementById("reply-content");
		var replyValue = replyContent.value.trim();
		var replyWarning = document.getElementById("reply-warning");
		if(replyValue==''){
			replyWarning.innerHTML = '<font color="red">내용을 입력해주세요.</font>';
			return false
		}
		
		return true;
	}
</script>
</html>