<%@page import="java.util.ArrayList"%>
<%@page import="vo.FreeVO"%>
<%@page import="dao.FreeDAO"%>
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
						int freeNo = Integer.parseInt(request.getParameter("tno"));
						FreeDAO dao = new FreeDAO();
						FreeVO free = dao.getFreeByNo(freeNo);
						//FreeVO reply = dao.getFreeByGno(free.getGno());

					%>
						<h2><strong>자유게시판</strong></h2>
					</div>
					<div class="panel-body">
						<table class="table">
							<thead>
								<tr> 
									<td colspan="2">
										<strong style="font-size: 150%;"> <%=free.getTitle() %> </strong>
										<br>
										<font style="font-size: 90%;">글쓴이: <%=free.getWriter() %>  ｜  작성일: <%=free.getRegdate() %>  ｜  조회수: <%=free.getCount() %></font>
									</td>
								</tr>
							</thead>
							<tr>
								<!-- 본문 내용 시작 -->
								<td colspan="2">
									<p style="padding-top: 10px; padding-bottom: 50px;">
									<% if(free.getContent()!=null){ %>
										<%if(free.getFilename() != null){ %>
											<a href="#">
												<img class="thumbnail" width="50%" height="auto" src="gallery/<%=free.getFilename() %>" alt="사진" onclick="doImgPop('gallery/<%=free.getFilename() %>')">
											</a>
										<%} %>
										<%=free.getContent().replaceAll("\n", "<br/>") %>
									<%} %>
									<%
										// 작성자와 로그인한 사용자가 같은경우 삭제, 수정버튼 생성
										if(isLogined==true){
										if(free.getWriter().equals(user.getUserId())) { 
									
									%>
										<!-- 삭제, 수정버튼 시작 -->
										<div style="text-align: right;">
											<form method="post" style="display: inline-block;" action="freemodify.jsp">
												<button type="submit" class="btn btn-warning btn-sm">수정</button>
												<input type="hidden" name="tno" value="<%=free.getNo()%>">
												<input type="hidden" name="currentPage" value="<%=pageNo%>">
											</form> 
											<form method="post" style="display: inline-block;" action="deleteFree.jsp" onsubmit="return areYouSure();">
												<button type="submit" class="btn btn-danger btn-sm">삭제</button>
												<input type="hidden" name="tno" value="<%=free.getNo()%>">
												<input type="hidden" name="currentPage" value="<%=pageNo%>">
											</form> 
										</div>
										<%}} %>
										<!-- 삭제, 수정 버튼 끝 -->
								</td>
								<!-- 본문 내용 끝 -->
							</tr>
							<%
								ArrayList<FreeVO> ReplyList = dao.getReplyList(free.getNo());
								for(FreeVO vo : ReplyList){
							%>
								<tr class="active">
									<td>
										<%=vo.getWriter() %> <small>(<%=vo.getRegdate() %>)</small><br>
								<% 
									if ("No".equals(vo.getIsVisible())) {
								%>
										<div style="padding-left: 10px !important; color: crimson">이 글은 관리자에 의해 블라인드 처리되었습니다.</div>
								<% 
									} else {
								%>
										<div style="padding-left: 10px !important;"><%=vo.getContent().replaceAll("\n", "<br/>") %></div>
								<% 
									}
								%>
									</td>
									<!-- 본인일경우 댓글 삭제버튼 표시 -->
									<td>
										<%
										if(isLogined){
											if(vo.getWriter().equals(user.getUserId())){ %>
											<form method="post" action="replydelete.jsp">
											<div class="text-right">
												<button type="submit" class="btn btn-default btn-xs">삭제</button>
												<input type="hidden" name="tno" value="<%=vo.getNo()%>">
												<input type="hidden" name="gno" value="<%=vo.getGno()%>">
												<input type="hidden" name="pno" value="<%=pageNo%>">
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
									<form method="post" action="reply.jsp" style="padding-left: 10px !important" onsubmit="return replycheck();">
										<div class="form-group">
											<label>댓글 달기</label>
											<textarea name="reply" id="reply-content" rows="1" class="form-control" placeholder="여기에 댓글을 입력하세요" <% if (user==null) { %> disabled="disabled">로그인후 이용가능합니다 <% } else { %>><% } %></textarea>
										</div>
										<div id="reply-warning"></div>
										<div class="text-right">
											<button type="submit" class="btn btn-success">등록</button>
											<input type="hidden" name="tno" value="<%=freeNo%>">
											<input type="hidden" name="pno" value="<%=pageNo%>">
											<input type="hidden" name="pno" id="is-login" value="<%=isLogined%>">
										</div>
									</form>
								</td>
							</tr>
						</table>
					</div>
					<div class="panel-footer text-right">
						<a href="freelist.jsp?pno=<%=pageNo %>" class="btn btn-info">목록</a>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<br>
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
	// 이미지 클릭시 원본 크기로 팝업 보기
	function doImgPop(img){ 
		 img1= new Image(); 
		 img1.src=(img); 
		 imgControll(img); 
	} 
	  
	function imgControll(img){ 
	 if((img1.width!=0)&&(img1.height!=0)){ 
		    viewImage(img); 
	  } 
	  else{ 
		    controller="imgControll('"+img+"')"; 
		    intervalID=setTimeout(controller,20); 
	  } 
	}
	function viewImage(img){ 
		 W=img1.width; 
		 H=img1.height; 
		 O="width="+W+",height="+H+",scrollbars=yes"; 
		 imgWin=window.open("","",O); 
		 imgWin.document.write("<html><head><title>이미지 확대보기</title></head>");
		 imgWin.document.write("<body topmargin=0 leftmargin=0>");
		 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
		 imgWin.document.close();
	}
</script>
</html>