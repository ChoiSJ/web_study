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
	.top {
		background-color: black;
		height: 200px;
	}
	.index {
		width: 100%;
		background-color: #e9ebee;
		height: 70px;;
	}
	li {
		padding: 5px;
		color: #666666;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
<div class="container-fluid main-container" style="padding-left: 0; padding-right: 0;">	
	<div class="top">
		<div class="col-md-6 col-md-offset-2 ">
			<h2 style="color: white;">오직, 음악</h2>
			<p  style="color: white;" >
			신중현, 송창식, 김창완, 주현미, 이승환, 제이슨 므라즈, 뱀파이어 위켄드, 클로드 볼링 등 국내외 최정상 아티스트부터 신
			인 발굴 프로젝트 ‘헬로루키’를 통해 선발한 국카스텐, 장기하와 얼굴들, 한음파, 아폴로 18, 야야, 바이바이 배드맨, 게이트
			플라워즈, 몽니, 데이브레이크 등 재능 있는 신진 아티스트까지 만날 수 있는 &#60;EBS 스페이스 공감>.</p>
			<p style="color: white;">
			록, 팝, 재즈, 클래식, 월드뮤직, 국악 등 장르와 관계없이 오직 좋은 음악을 통해 관객과 공감하기 위해 노력하고 있습니다.
			</p>
		</div>
		<div class="col-md-2">
			<p>
				<img alt="intro" src="../photoGallery/introtop.png" align="right">
			</p>
		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="index">
		<div class="col-md-8 col-md-offset-2 index-1" >
			<h3><strong>제작진 소개</strong></h3>
		</div>
	</div>
	<!-- 설명 부분 -->	
	<div class="staff-info" style="padding-left: 12px;">
		<div class="com-md-8 col-md-offset-2">
			<h4 style="margin-top: 50px;"><strong>공연의 감동을 방송으로</strong></h4>
			<p style="color: #666666">
				2004년 4월 1일 첫 공연 이래로 EBS 스페이스공감은 관객 여러분께 양질의 공연을 무료로 선보이며 대중음악의 다양화에 앞장서고 있습니다.<br />
				또한 좋은 공연 실황을 엄선하여 라이브 공연에서만 느낄 수 있는 감동을 안방까지 생생하게 전달하고 있습니다.<br />
				목요일 밤 24시 10분, 25시 5분(두편 연속) 여러분의 TV를 통해 만나실 수 있습니다.<br />
			</p>
		</div>
		<div class="com-md-8 col-md-offset-2">
			<h4 style="margin-top: 70px;"><strong>EBS 스페이스공감 제작진</strong></h4>
			<p style="color: #666666">
				대한민국 모든 이들이 음악과 공감하는 그날을 꿈꾼다!<br />
				EBS 스페이스공감 제작진을 소개합니다.<br />
			</p>
			<div style="border:1px solid #dcdcdc; padding-top: 20px; padding-bottom: 10px; width: 80%">
				<ul style="list-style: none; padding-left: 10px;">
					<li><strong style="color: black;">책임 프로듀서</strong>
					&nbsp; &nbsp;김우철</li>
					<li><strong style="color: black;">프로듀서</strong>
					&nbsp; &nbsp;이혜진, 김규옥, 이나연</li>
					<li><strong style="color: black;">조연출</strong>
					&nbsp; &nbsp;김유림, 윤지혜, 한주연</li>
					<li><strong style="color: black;">작가</strong>
					&nbsp; &nbsp;김효정, 변고은, 이호림, 전연우, 권현우</li>
					<li><strong style="color: black;">무대감독</strong>
					&nbsp; &nbsp;최경현</li>
					<li><strong style="color: black;">무대진행</strong>
					&nbsp; &nbsp;성보경, 이한길</li>
					<li><strong style="color: black;">카메라감독</strong>
					&nbsp; &nbsp;양정식, 배정수, 정호균, 이응석, 윤설영</li>
					<li><strong style="color: black;">음향감독</strong>
					&nbsp; &nbsp;정영재, 이승민, 남영모</li>
					<li><strong style="color: black;">조명감독 </strong>
					&nbsp; &nbsp;진대중, 이인정</li>
					<li><strong style="color: black;">악기프리사운드</strong>
					&nbsp; &nbsp;김성희, 홍상현</li>
					<li><strong style="color: black;">분장</strong>
					&nbsp; &nbsp;김영임</li>
					<li><strong style="color: black;">공연진행 및 홍보</strong>
					&nbsp; &nbsp;재미진사무소 김소현, 김지윤, 명의정, 심소연</li>
					<li><strong style="color: black;">기획위원</strong>
					&nbsp; &nbsp;김현준, 박은석, 김학선, 김광현, 김윤하</li>
					<li><strong style="color: black;">사진서포터즈</strong>
					&nbsp; &nbsp;김영우, 문지선, 유순, 이미지, 이진아, 정승민, 정현석, 최정순</li>
					<li><strong style="color: black;">공감서포터즈</strong>
					&nbsp; &nbsp;김서희, 김승환, 김태연, 박수진, 선인수, 안지선, 정승민</li>
					
				</ul>
				
			</div>
			<br>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>