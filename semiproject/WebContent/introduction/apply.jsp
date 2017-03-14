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
<title>apply</title>
<style type="text/css">
	
	
	.top {
		background-color: black;
		height: 200px;
	}
	.index {
		width: 100%;
		background-color: #e9ebee;
		height: 460px;
	}
	.apply-img {
		margin-top: 30px;
	}
	.apply-atten {
		margin-top: 30px;
	}
	.atten-in {
		color: #7a7a7a;
		font-size: 10pt;
	}
	.atten-in-1 {
		color: #7a7a7a;
		font-size: 9pt;
	}
	.atten-in-2 {
		color: #cf1e51;
		font-size: 9pt;
	}
	.program-info {
		margin-bottom: 30px;
	}
	.info-in {
		color: #7a7a7a;
		font-size: 10pt;
	}
	
</style>
</head>
<body>
	
<%@ include file="../common/header.jsp"%>
<div class="container-fluid main-container" style="padding-left: 0; padding-right: 0;">	
	<div class="contents">
		<div class="top">
			<div class="col-md-6 col-md-offset-2 ">
				<h2 style="color: white;">오직, 음악</h2>
				<p  style="color: white;" >
				신중현, 송창식, 김창완, 주현미, 이승환, 제이슨 므라즈, 뱀파이어 위켄드, 클로드 볼링 등 국내외 최정상 아티스트부터 신<br>
				인 발굴 프로젝트 ‘헬로루키’를 통해 선발한 국카스텐, 장기하와 얼굴들, 한음파, 아폴로 18, 야야, 바이바이 배드맨, 게이트<br>
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
	
		<!-- 방청신청과정 -->
		<div class="index">
			<div class="col-md-10 col-md-offset-2 ">
				<h3><strong>신청에서 관람까지</strong></h3>
				<p>매주 월요일부터 목요일까지 무료로 진행되는 공연을 관람해보세요!</p>
			
				<img alt="applystep" src="/photoGallery/applystep.png" class="apply-img">
			</div>
		</div>
		<!-- 유의사항 -->
		<div class="apply-atten" >
			<div class="col-md-6 col-md-offset-2 ">
				<h4><strong>티켓 수령 방법 및 관람 시 유의사항</strong></h4>
				<p class="atten-in">티켓은 공연 시작 1시간 전 EBS 스페이스공감 티켓부스에서 수령하실 수 있습니다.</p>
				<p class="atten-in-1">- 본인관람 : 신분증 확인</p>
				<p class="atten-in-1">- 양도관람 : 당첨자 이름, ID, 전화번호 끝 4자리 확인 후 배부</p>
				<p class="atten-in-2">* SNS계정으로 로그인하신 경우 입력하신 SNS 계정정보로 확인이 가능합니다.</p>
				<br>
				<p class="atten-in">공연 시작 20분 전부터 입장이 가능하며, 공연이 시작된 이후에는 입장하실 수 없습니다.</p>
			</div>
		</div>
		<!-- 방송안내 -->
		<div class="program-info">
			<div class="col-md-10 col-md-offset-2 ">
				<h4><strong>EBS 스페이스공감 공연/방송 시간 안내</strong></h4>
				<p class="info-in">공연 : 월요일 ~ 금요일 저녁 7시 30분</p>
				<p class="info-in">방송 : 목요일 밤 24시 10분, 25시 5분(두편 연속 방송)</p>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
	
</div>
</body>
</html>