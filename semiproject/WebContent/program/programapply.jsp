<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProgramApplyDAO"%>
<%@page import="vo.ProgramApplyVO"%>
<%@page import="dao.ProgramDAO"%>
<%@page import="vo.ProgramVO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html >
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.container {
		float: none;
    	position: relative;
    	width: 100%;
    	min-height: 700px;
    	padding-bottom: 25px;
    	background: #fff;
    	z-index: 1;
	}
	.sub_visual {
		float: none;
    	width: 100%;
    	margin-bottom: 15px;
	}
	.reactWrap {
		width: 1200px;
    	margin: 0 auto;
    	padding: 0 1.5%;
	}
	.page_tit {
		position: relative;
    	/* overflow: hidden; */
    	padding: 0 0 10px;
	}
	.page_tBox {
		border: 1px solid #c1c0c2;
   		text-align: left;
	}
	.list_dot {
		overflow: hidden;
	}
	.tb_tit {
		display: block;
    	margin-bottom: 10px;
    	color: #000;
    	font-size: 20px;
    	font-weight: bold;
    	line-height: 21px;
	}
	.c_seclet {
		vertical-align: top;
	}
	.c_secetWrap {
		position: absolute;
    	left: -1px;
    	top: -1px;
    	overflow-x: hidden;
    	overflow-y: auto;
    	width: 100%;
    	max-height: 250px;
    	border: 0 none;
    	z-index: 2;
	}
	th {
		width: 200px;
	}
	.essential {
		display: inline-block;
    	color: #f66198;
    	font-size: 12px;
    	font-weight: 400
	}
	.btn_area {
		text-align: center !important;
		padding: 10px 0 0;
		margin: 0;
	}
	.c_btn {
		border: 1px solid #f66198;
    	background: #f66198;
    	color: #fff;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%
	if(user == null){
		response.sendRedirect("/account/login.jsp");
		return;
	}
	%>
	<%
		int no = Integer.parseInt(request.getParameter("ano"));
		ProgramDAO dao = new ProgramDAO();
		ProgramApplyDAO adao = new ProgramApplyDAO();
		ProgramVO program = dao.getProgramByNo(no);
		ArrayList<ProgramApplyVO> applyList = adao.getAllApplyListById(user.getUserId());
		
		for (ProgramApplyVO newapply : applyList) {
			if (no == newapply.getProgramNo()) {
				response.sendRedirect("/program/programdetail.jsp?pno="+ no + "&err=duplication");
				return;
			}
		}
	%>
<div class="container-fluid main-container" style="padding-left: 0; padding-right: 0;">	
	<div class="container">
		<div class="sub_visual">
			<div class="reactWrap">
				<!-- 관람신청 안내글 -->
				<div class="page_tit">
					<h2>관람신청</h2>
				</div>
				<div class="page_tBox boxGray">
					<ul class="list_dot recBlack">
						<br>
						<li>티켓 신청은 1인 2매까지 가능하며, 티켓 1매당 1인만 입장 가능합니다.</li>
						<br>
						<li>사연은 공백 포함하여 최대 250자까지 입력 가능합니다.</li>
						<br>
						<li>당첨결과는 공연 3일 전부터 ‘나의 공감’의 [공연 당첨 확인]에서 확인 가능합니다.</li>
						<br>
						<li>공연은 초등학생 이상부터 관람 가능합니다.</li>
						<br>
					</ul>
				</div>
			</div>
		</div>
		<!-- 신청자 정보 입력 -->
		<div class="sub_conts">
			<div class="reactWrap">
				<form action="/program/applyprocess.jsp" method="post" id="aplication_program" onsubmit="return formcheck();">
					<div class="entry_form">
						<strong class="tb_tit">신청자 정보</strong>
						<div class="tb_write">
							<table class="spaceRes table">
								<tbody>
									<tr>
										<th>
											<label>신청공연일자</label>
										</th>
										<td style="margin-left: 30px;">
											<div class="c_select" style="width: 100%;" tabindex="0">
												<select id="perfome-select" style="width: 300px;" name="selectprogram">
													<option>공연을 선택해 주세요</option>
													<option value="<%=no %>">[<%=program.getProgramDate() %>]&nbsp; &nbsp; <%=program.getArtistName() %>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<th>
											<label>이름</label>
										</th>
										<td>
											<label id="apply-username" ><%=user.getUserName() %></label>
										</td>
									</tr>
									<tr>
										<th>
											<label>연락처</label>
											<span class="essential" >(필수)</span>
										</th>
										<td>
											<input type="tel" name="applytel" id="apply-tel">
										</td>
									</tr>
									<tr>
										<th>
											<label>신청매수</label>
										</th>
										<td>
											<select id="count-ticket" name="countticket" id="ticket">
												<option value="2">2매</option>
												<option value="1">1매</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>
											<label>신청사유</label><br>
											<span> 
												<strong id="currentByte">0</strong>/250자
											</span>
										</th>
										<td>
											<textarea id="reason" rows="3" cols="100" name="reason"></textarea>
										</td>
									</tr>
								</tbody>
								
							</table>
						</div>
					</div>
					<div class="btn_area">
						<button type="submit" class="c_btn">관람신청</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</div>
</body>
<script type="text/javascript">
	$(function() {
 	   $('#reason').keyup(function (e){
 	       var content = $(this).val();
 	       $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
	        $('#currentByte').html(content.length);
	    });
	    $('#currentByte').keyup();
	});

	function formcheck() {
		var programEL = document.getElementById("perfome-select");
		var program = programEL.value;
		if (program == "공연을 선택해 주세요") {
			alert("공연을 선택해 주세요.");
			programEL.focus();
			return false;
		}
		var telEL = document.getElementById("apply-tel");
		var tel = telEL.value.trim();
		var patternTel = /^01[016789]-\d{3,4}-\d{4}$/;
		if (!patternTel.test(tel)) {
			alert("유효한 전화번호 형식이 아닙니다.");
			telEL.focus();
			return false;
		}
		return true;
	}
	
	var ticket = document.getElementById("ticket");
	console.log(ticket);
</script>

</html>