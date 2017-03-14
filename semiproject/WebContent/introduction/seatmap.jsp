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
<title>seatmap</title>
<style type="text/css">
	.top {
		background-color: black;
		height: 200px;
	}
	.index {
		width: 100%;
		background-color: #e9ebee;
		height: 520px;
		margin-bottom: 20px;
	}
	.index-1 {
		margin-bottom: 30px;
	}
	.index-2 {
		margin-top: 30px;
	}
	.seat-img {
		margin-left: 100px;
	}
	.seat-in {
		color: #7a7a7a;
		font-size: 10pt;
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
	<!-- 좌석표 -->
	<div class="index">
		<div class="col-md-10 col-md-offset-2 index-1">
			<h3><strong>좌석배치도</strong></h3>
			<div class="seat-img">
				<img alt="seatmap" src="/photoGallery/seat.png">
			</div>
		</div>
		<div class="col-md-10 col-md-offset-2 index-2">
			<p class="seat-in">* 총 좌석수는 159석이며, 어느 자리나 무대와 가깝습니다.</p>
			<p class="seat-in">* 좌석은 선착순으로 좋은 좌석부터 배정해 드립니다.(티켓은 공연 1시간 전부터 배포)</p>
		</div>
		<br>
	</div>
<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>