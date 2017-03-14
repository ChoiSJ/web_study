<%@page import="java.util.ArrayList"%>
<%@page import="vo.ProgramVO"%>
<%@page import="dao.ProgramDAO"%>
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
	ProgramDAO pdao = new ProgramDAO();
	ArrayList<ProgramVO> pvolist = new ArrayList<>();
	pvolist = pdao.getAllProgramList();
	int no = Integer.parseInt(request.getParameter("no"));
	int pageNo = Integer.parseInt(request.getParameter("pno"));
%>
<div class="container-fluid">
	<div class="panel panel-info">
		<div id="top-title" class="panel-heading">
			<h2><strong>공연 . 방송 관람후기</strong></h2>
			<p>EBS 스페이스공감의 공연이나 방송을 보신 후 소중한 감상을 남겨주세요.</p>
		</div>
		<div class="panel-body">
		<form method="post" action="../reviewPhotoEditer" enctype="multipart/form-data" onsubmit="return checkform();">
			<table class="table table-condensed">
					<tr>
						<th colspan="1">공연명</th>
						<th colspan="3">
							<div class="form-group">
							<select id="program_name" class="form-control" name="programname">
							<%
								for(ProgramVO pvo : pvolist){
							%>
									<option>[<%=pvo.getProgramDate() %>] <%=pvo.getProgramName() %> (<%=pvo.getArtistName() %>)</option>
							<%
								}
							%>
							</select>
							</div>
						</th>
					</tr>
					<tr>
						<td colspan="1">제목</td>
						<td colspan="3">
							<div class="form-group">
								<input type="text" name="title" id="review_title" placeholder=" 제목"/>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="1">내용</td>
						<td colspan="3">
							<div class="form-group">
								<textarea class="form-control" rows="3" name="content" id="review_content" placeholder="내용"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="1">파일첨부</td>
						<td colspan="3">
							<div class="form-group">
								<input type="file" id="File-name" name="file" class="form-control">
							</div>
							<ul>
								<li> 첨부파일은 10MB 이하만 업로드 가능</li>
								<li> 첨부파일은 최대 1개까지 등록가능</li>
								<li> jpg, jpeg,만 첨부가능  </li>
							</ul>				
						</td>
					</tr>
					<tr>
						<td colspan="1">평점</td>
						<td colspan="3">
							<p>‘공연이 마음에 드셨으면 ‘별점‘을 눌러서 공연을 추천해 주세요!‘</p>
							<div class="form-group">
							<input type="radio" name="score" id="scoreChk" class="form-group" checked="checked" value="1"/><span class="up">1</span>&nbsp;&nbsp;
							<input type="radio" name="score" id="scoreChk" class="form-group" value="2"/><span class="up">2</span>&nbsp;&nbsp;
							<input type="radio" name="score" id="scoreChk" class="form-group" value="3"/><span class="up">3</span>&nbsp;&nbsp;
							<input type="radio" name="score" id="scoreChk" class="form-group" value="4"/><span class="up">4</span>&nbsp;&nbsp;
							<input type="radio" name="score" id="scoreChk"class="form-group" value="5"/><span class="up">5</span>&nbsp;&nbsp;
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="1">
							<div class="form-group">
								<input type="hidden" class="form-group" name="userid" value="<%=user.getUserId() %>">
								<input type="hidden" class="form-group" name="username" value="<%=user.getUserName() %>">
								<input type="hidden" class="form-group" name="reviewno" value="<%=no %>">
								<input type="hidden" class="form-group" name="pageno" value="<%=pageNo %>">
							</div>
						</td>
						<td colspan="3">
							<span style="float:right">
								<a href="reviewDetail.jsp?no=<%=no %>&pno=<%=pageNo %>" class="btn btn-info" role="button">목록</a>
								<button type="submit" class="btn btn-success">등록</button>
							</span>	
						</td>
					</tr>
			</table>	
		</form>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
function checkform(){	
	var title = document.getElementById("review_title");
	var title1 = title.value;
	var content = document.getElementById("review_content");
	var content1 = content.value;
		
	if(title1 == ""){
		alert("제목을 입력하세요");
		return false;			
	}
	
	if(content1 ==""){
		alert("내용을 입력하세요");
		return false;
	}
	
	var imgformat = "\.(jpg|jpeg)$";
	if(!(new RegExp(imgformat, "i")).test(document.insform.file.value)){
		alert("jpg, jpeg 파일만 등록 가능");
		return false;
	}
		
	return true;
}
</script>
</html>