<%@page import="vo.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
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
<title>Review Detail</title>
<style type="text/css">
	.container {
		margin-top: 50px;
	}
	
	hr {
		margin-top: 5px;
		margin-bottom: 5px;
	}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-sm-10 col-sm-offset-1">
			<div class="panel panel-default">
				<div class="panel-heading"><h4>리뷰 게시판</h4></div>
				<div class="panel-body">
					<table class="table table-default">
						<thead>
							<tr>
								<th>No</th>
								<th>리뷰제목</th>
								<th>유저아이디</th>
								<th>유저명</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
					<%
						request.setCharacterEncoding("utf-8");
						String programName = request.getParameter("pn");
						String artistName = request.getParameter("an");
						ReviewDAO dao = new ReviewDAO();
						ArrayList<ReviewVO> reviewList = dao.getReviewList(programName, artistName);
						int index = 1;
	
						for (ReviewVO review : reviewList) {
					%>
							<tr>
								<td><%=index %></td>
								<td id="review-title-<%=index %>"><a data-toggle="modal" data-target="#titleModal-<%=index %>"><%=review.getTitle() %></a></td>		
								<td><%=review.getUserId() %></td>
								<td><%=review.getUserName() %></td>
								<td id="review-regdate-<%=index %>"><%=review.getRegdate() %></td>
								<td id="review-content-<%=index %>" style="display: none;"><%=review.getContent() %></td>
								<td id="review-number-<%=index++ %>" style="display: none;"><%=review.getNo() %></td>
							</tr>
						</tbody>
					<%
						}
					%>		
					</table>
				<% 
					for (int i=1; i<index; i++) {
				%>
					<div class="modal fade" id="titleModal-<%=i %>" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h5 class="modal-title">리뷰 상세정보</h5>
								</div>
								<div class="modal-body">
									<div id="review-title-modal-<%=i %>"><strong>제목: </strong></div><hr>
									<label>내용</label><br><div id="review-modal-<%=i %>"></div><hr>
									<label>아티스트명</label><br><%=artistName %><hr>
									<label>등록일</label><div id="review-regdate-modal-<%=i %>"></div>
								</div>
								<div class="modal-footer">
									<button id="delete-button" class="btn btn-danger" onclick="deleteReply(<%=i %>)">삭제</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									<input type="hidden" id="review-number-input-<%=i %>"/>
								</div>
							</div>
						</div>
					</div>
				<% 
					}
				%>
				<input type="hidden" id="index" value="<%=index %>"/>
				</div>
				<div class="panel-footer" align="right">
					<a class="btn btn-default" href="adminreviewlist.jsp">돌아가기</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body> 
<script type="text/javascript">
	var indexId = document.getElementById("index"); 
	var index = indexId.value;
	
	for (var i=1; i<index; i++) {
		var reviewTitle = document.getElementById("review-title-"+i+"");
		var reviewtitleModal = document.getElementById("review-title-modal-"+i+"");
		reviewtitleModal.innerHTML += reviewTitle.textContent;
		
		var reviewContent = document.getElementById("review-content-"+i+"");
		var reviewModal = document.getElementById("review-modal-"+i+"");
		reviewModal.textContent = reviewContent.textContent;
		
		var reviewRegdate = document.getElementById("review-regdate-"+i+"");
		var reviewRegdateModal = document.getElementById("review-regdate-modal-"+i+"");
		reviewRegdateModal.textContent = reviewRegdate.textContent;
		
		var reviewNumber = document.getElementById("review-number-"+i+"");
		var reviewNumberInput = document.getElementById("review-number-input-"+i+"");
		reviewNumberInput.value = reviewNumber.textContent;
	} 
	
	function deleteReply(no) { 
		var value = document.getElementById("review-number-input-"+no+"").value;
		var xhr = new XMLHttpRequest();
	
		xhr.open("GET", "deletereviewreplyprocess.jsp?dno=" + value);
		xhr.send();
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				location.reload();
			}
		}
	}
</script>
</html>