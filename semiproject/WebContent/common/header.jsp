<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<style type="text/css">
	.navbar {
		margin-bottom: 0;
		border-radius: 0;
	}

	.collapsing {
		display: none;
	}
	
	.logo {
		padding: 0px 0px 25px 0px;
	}
</style>
<!-- 헤더 시작 -->
<div class="header">
	<!-- 로고 시작 -->
	<h1 class="logo" align="center">
		<a href="/main.jsp"><img alt="logo" src="/photoGallery/logo_space.png" style="width: 180px;"></a>
	</h1>
	<!-- 로고 끝 -->

	<!-- 내비바 시작 -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" data-toggle="collapse" data-target="#one">공감소개</a></li>
					<li class="dropdown"><a href="#" data-toggle="collapse" data-target="#two">공연</a></li>
					<li class="dropdown"><a href="#" data-toggle="collapse" data-target="#three">게시판</a></li>
					<li class="dropdown"><a href="#" data-toggle="collapse" data-target="#four">나의공감/당첨확인</a></li>
				
				<%
					boolean isLogined = false;
					UserVO user = null;
				
					HttpSession session = request.getSession(false);
					if (session != null) {
						user = (UserVO) session.getAttribute("LOGINED_USER");
						if (user != null) {
							isLogined = true;
						}
					}
				%>
				<%	
					// admin1234 / Admin123$
					// test1234 / Test123$
					if (user != null && "admin1234".equals(user.getUserId())) {
				%>
						<li class="dropdown"><a href="#" data-toggle="collapse" data-target="#five">관리자메뉴</a></li>
				<%	
					}
				%>
				</ul>
				<%
					if (isLogined) {
				%>
					<ul class="nav navbar-nav pull-right">
						<li><a><strong><%=user.getUserId() %></strong>님 환영합니다.</a></li>
						<li class="dropdown"><a href="#" data-toggle="collapse" data-target="#six">회원정보수정</a></li>
						<li class=""><a href="/account/logout.jsp"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
					</ul>								
				<%
					} else {
				%>
					<ul class="nav navbar-nav pull-right">
						<li class=""><a href="/account/login.jsp"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
						<li class=""><a href="/account/signup.jsp">회원가입</a></li>
					</ul>				
				<%		
					}
				%>
			</div>
			<nav class="navbar navbar-inverse" role="navigation" id="submenu">
				<ul class="nav navbar-nav collapse" id="one">
					<li><a href="/introduction/apply.jsp" id="">신청에서 관람까지</a></li>
					<li><a href="/introduction/seatmap.jsp" id="">좌석배치도</a></li>
					<li><a href="/introduction/map.jsp" id="">찾아오시는 길</a></li>
					<li><a href="/introduction/staff.jsp" id="">제작진 소개</a></li>
				</ul>
				<ul class="nav navbar-nav collapse" id="two">
					<li><a href="/program/program.jsp" id="">공연안내 및 관람신청</a></li>
					<li><a href="/program/programapplyinfo.jsp" id="">관람신청안내</a></li>
				</ul>
				<ul class="nav navbar-nav collapse" id="three">
					<li><a href="/noticebd/noticeList.jsp" id="">공지사항</a></li>
					<li><a href="/reviewbd/reviewList.jsp" id="">공연&middot;방송 관람후기</a></li>
					<li><a href="/freebd/freelist.jsp" id="">자유게시판</a></li>
					<li><a href="/qnabd/qnalist.jsp" id="">Q&amp;A</a></li>
				</ul>	
				<ul class="nav navbar-nav collapse" id="four">
					<li><a href="/program/checkapply.jsp" id="">공연당첨확인</a></li>
					<li><a href="/imymemy/mywords.jsp" id="">내가 쓴 글 보기</a></li>
				</ul>
				<ul class="nav navbar-nav collapse" id="five">
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" id="">게시판 리스트<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/admin/adminNoticeList.jsp">공지</a></li>
						<li><a href="/admin/adminfreelist.jsp?pno=1">자유게시판</a></li>
						<li><a href="/admin/adminreviewlist.jsp">리뷰</a></li>
						<li><a href="/admin/adminqnalist.jsp">Q&amp;A</a></li>
					</ul>
					</li>
					<li><a href="/admin/userlist.jsp" id="">유저 리스트</a></li>
					<li><a href="/admin/programmodifylist.jsp" id="">공연리스트</a></li>
					<li><a href="/admin/confirmationlist.jsp" id="">당첨관리</a></li>
				</ul>
			<%
				if (isLogined) {
			%>	
				<ul class="nav navbar-nav collapse pull-right" id="six">
					<li><a href="/account/modify.jsp?uno=<%=user.getUserNo() %>">기본정보변경</a></li>
					<li><a href="/account/passwordmodify.jsp">비밀번호변경</a></li>
				</ul>
			<%		
				}
			%>
			<script type="text/javascript">
				$('.collapse').on('shown.bs.collapse', function(e) {
					$('.collapse').not(this).removeClass('in');
				});

				$('[data-toggle=collapse]').click(function(e) {
					$('[data-toggle=collapse]').parent('li').removeClass('active');
					$(this).parent('li').toggleClass('active');
				});
			</script>
			</nav>
		</div>
	</nav>
	<!-- 내비바 끝 -->
</div>
<!-- 헤더 끝 -->