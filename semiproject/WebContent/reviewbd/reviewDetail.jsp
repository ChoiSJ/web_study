<%@page import="vo.PageVO"%>
<%@page import="util.ChangeStr"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.ReviewReVO"%>
<%@page import="vo.ReviewVO"%>
<%@page import="dao.ReviewDAO"%>
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
<title>리뷰게시판 | 스페이스공감 - 교육의 중심 EBS</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<%
	int pageNo = Integer.parseInt(request.getParameter("pno"));
	int no = Integer.parseInt(request.getParameter("no"));
	ReviewDAO rdao = new ReviewDAO();
	ReviewVO rvo = new ReviewVO();
	rvo = rdao.getReviewByNo(no);
%>
<div class="container-fluid main-container" style="padding-left: 0; padding-right: 0;">
	<div class="container">
	<div class="col-md-12">
	<div class="panel panel-default">
		<div id="top-title" class="panel-heading">
				<h2><strong>공연 . 방송 관람후기</strong></h2>
				<p>EBS 스페이스공감의 공연이나 방송을 보신 후 소중한 감상을 남겨주세요.</p>
		</div>
		<div class="panel-body">
			<table class="table">
			<thead>
  				<tr>
    				<th>
    					<%
    						String userName = ChangeStr.changeName(rvo.getUserName());
    						String userid = ChangeStr.changeName(rvo.getUserId());
    					%>
    					<p class="text-left"><%=userName %>(<%=userid %>) | <%=rvo.getRegdate() %></p>
    					<p class="text-left"><%=rvo.getProgramName() %> | <%=rvo.getTitle() %> | (<%=rvo.getScore() %> / 5 평점)</p>
    				</th>
  				</tr>
  			</thead>
  				<tr>
  					<td colspan="2">
  						<p><img src="reviewPhoto/<%=rvo.getUserId() %>/<%=rvo.getFileName() %>" alt="사진" width="50%" height="auto"></p>
  						<p><%=rvo.getContent().replaceAll("\n", "<br/>") %></p>
  						<p class="text-right">
						<%
							if(user != null){
							if(rvo.getUserId().equals(user.getUserId())){
						%>
						<a href="reviewEdit.jsp?no=<%=rvo.getNo()%>&pno=<%=pageNo%>" class="btn btn-warning">수정</a>
						<a href="reviewDel.jsp?no=<%=rvo.getNo()%>" class="btn btn-danger">삭제</a>
						<%
							} else if ("admin1234".equals(user.getUserId())) {
						%>
						<a href="reviewDel.jsp?no=<%=rvo.getNo()%>" class="btn btn-danger">삭제</a>
						<%
							}
						}
						%>
						</p>
  					</td>
				</tr>
				<%	
					ArrayList<ReviewReVO> reviewRelist = new ArrayList<>();
					reviewRelist = rdao.getReviewReList(no);
					for(ReviewReVO revo : reviewRelist){
				%>
				<tr class="active">
					<td>
    					<p class="text-left"><%=revo.getUserName() %> | <%=revo.getRegdate() %> </p>
    					<p class="text-left"><%=revo.getContent().replaceAll("\n", "<br/>") %></p>
    				</td>
    				<td>
    					<%
    						if(user != null){
    					%>
    					<%
    							if(revo.getUserId().equals(user.getUserId())||"admin1234".equals(user.getUserId())){
    					%>
    						<form method="post" action="reviewReplyDel.jsp">
    							<div class="text-right">
    								<input type="hidden" name="replyNo" value="<%=revo.getReviewRno() %>">
									<input type="hidden" name="pageNo" value="<%=pageNo %>">
									<input type="hidden" name="reviewNo" value="<%=no %>">
    								<button type="submit" class="btn btn-default btn-xs">삭제</button>
    							</div>
    						</form>
    					<%
    						}
    					}
    					%>
    				</td>
				</tr>
				<%
				}
				%>
				<tr>
					<td colspan="2">
					<form method="post" action="reviewReplyRegister.jsp" onsubmit="return checkRe();">
						<%
						int reCount = rdao.getReviewReplyCount(no);
						if(user != null){
					%>
						<p class="text-left">한줄 댓글 (<%=reCount %>) | <%=user.getUserName() %></p>
					<%
						} else {
					%>
						<p class="text-left">한줄 댓글 (<%=reCount %>) | </p>
					<% 
						}
					%>
					<%
						if(user != null){
					%>
							<div class="text-right">
								<input type="hidden" name="userid" value="<%=user.getUserId() %>">
								<input type="hidden" name="username" value="<%=user.getUserName() %>">
								<input type="hidden" name="reviewno" value="<%=no %>">
								<input type="hidden" name="pageno" value="<%=pageNo %>">
								<textarea id="reply-content" name="recontent" placeholder="댓글입력." style="width:100%;height:100%;"></textarea>
								<button type="submit" class="btn btn-success">등록</button>
							</div>
					<%
							} else {
					%>
							<div class="form-group">
								<textarea id="reply-content" name="recontent" placeholder="로그인 후 이용 가능합니다." style="width:100%;height:100%;"onclick="fn1()"></textarea>
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
			<a href="reviewList.jsp?no=<%=rvo.getNo()%>&pno=<%=pageNo%>" class="btn btn-info">목록</a>
			<div style="text-align: center;">
			<%
				PageVO pnvo = new PageVO();
				pnvo = rdao.prevNextPage(rvo.getNo());
				final int ROWS_PER_PAGE = 10;
				
				int reviewNextNo = pnvo.getNext();
				int reviewPrevNo = pnvo.getPrev();
				int reviewPageNo = pnvo.getNowNo();
				
				int testno = reviewPageNo%ROWS_PER_PAGE;
				int totalPages = (int) Math.ceil((double)reviewPageNo/ROWS_PER_PAGE);
				
				if(reviewNextNo != 0 && reviewPrevNo !=0){
					if(testno == 0){
			%>			
				<a href="reviewDetail.jsp?no=<%=reviewNextNo %>&pno=<%=totalPages%>" class="btn btn-info">다음글</a> | 
				<a href="reviewDetail.jsp?no=<%=reviewPrevNo %>&pno=<%=totalPages+1%>" class="btn btn-info">이전글</a>
			<%
					} else if (testno == 1){
			%>			
				<a href="reviewDetail.jsp?no=<%=reviewNextNo %>&pno=<%=totalPages-1%>" class="btn btn-info">다음글</a> | 
				<a href="reviewDetail.jsp?no=<%=reviewPrevNo %>&pno=<%=totalPages%>" class="btn btn-info">이전글</a>
			<%
					} else {
			%>
				<a href="reviewDetail.jsp?no=<%=reviewNextNo %>&pno=<%=totalPages%>" class="btn btn-info">다음글</a> | 
				<a href="reviewDetail.jsp?no=<%=reviewPrevNo %>&pno=<%=totalPages%>" class="btn btn-info">이전글</a>
			<%			
					}
				} else if(reviewNextNo != 0 && reviewPrevNo == 0) {
					if (testno == 1){
			%>
				<a href="reviewDetail.jsp?no=<%=reviewNextNo %>&pno=<%=totalPages-1%>" class="btn btn-info">다음글</a> 
			<%
					} else {
			%>
				<a href="reviewDetail.jsp?no=<%=reviewNextNo %>&pno=<%=totalPages%>" class="btn btn-info">다음글</a>
			<%			
					}
				} else if(reviewNextNo == 0 && reviewPrevNo != 0) {
			%>
				<a href="reviewDetail.jsp?no=<%=reviewPrevNo %>&pno=<%=totalPages%>" class="btn btn-info">이전글</a>
			<%
				}
			%>
			</div>
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
	var reply1 = document.getElementById("reply-content");
	var reply2 = reply1.value;
	if(reply2 ==""){
		alert("댓글을 입력하세요");
		return false;
	}
	return true;
}
</script>
</html>