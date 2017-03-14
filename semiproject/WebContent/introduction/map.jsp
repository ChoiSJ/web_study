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
		height: 460px;
	}
	.map {
		margin-top: 20px;
	}
	.subway {
			color: #666666;
	}
	.bus-info {
		color: #666666;
		
	}
	.pinkmark {
		margin-right: 5px;
    	font-size: 12px;
    	vertical-align: middle;
    	background: #d65071;
    	display: inline-block;
    	overflow: hidden;
    	height: 22px;
    	padding: 0 11px;
    	border-radius: 11px;
    	color: #fff;
    	line-height: 21px;
	}
	ul {
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
		<div class="col-md-8 col-md-offset-2 index-1">
			<h3><strong>찾아오시는 길</strong></h3>
			<div id="map" style="width:100%;height:350px;" class="map"></div>

			
		</div>
	</div>
	<!-- 설명 부분 -->
	<div class="route-info">
		<div class="com-md-8 col-md-offset-2">
			<h3><strong>지하철 이용 시</strong></h3>
			<hr width="80%" color="#e9ebee" align="left">
			<p class="subway">3호선 매봉역 3번출구 우측 방향</p>
			<hr width="80%" color="#e9ebee" align="left">
			<br>
			<h3><strong>버스 이용 시</strong></h3>
			<hr width="80%" color="#e9ebee" align="left">
			<table>
				<tr>
					<td style="padding-left: 12px;">
						<span class="bus-info">
							매봉역(23-323)<br>
							하차 후 도보 3분거리
						</span>
					</td>
					<td style="width:; border-right:1px solid #e9ebee; padding-right:12px; padding-left:12px; text-align:justify;">
						<p>
							<span class="pinkmark">일반</span>
							11-3, 917번
						</p>
						<p>
							<span class="pinkmark">지선</span>
							3012, 4319, 4433, 4435번
						</p>
						<p>
							<span class="pinkmark">간선</span>
							402, 406, N37번
						</p>
					</td>
					<td  style="padding-left: 12px;">
						<span class="bus-info">
							매봉역(23-695)<br>
							하차 후 도보 3분거리
						</span>
					</td>
					<td style="width:; border-right:1px solid #e9ebee; padding-right:12px; padding-left:12px; text-align:justify;">
						<p>
							<span class="pinkmark">마을</span>
							강남 02번
						</p>
						
					</td>
					<td  style="padding-left: 12px;">
						<span class="bus-info">
							매봉역(23-323)<br>
							하차 후 도보 3분거리
						</span>
					</td>
					<td style="padding-right:12px; padding-left:12px;">
						<p>
							<span class="pinkmark">지선</span>
							3012, 4319, 4433, 4435번
						</p>
						<p>
							<span class="pinkmark">간선</span>
							402, 406, N37번
						</p>
						<p>
							<span class="pinkmark">마을</span>
							강남02번
						</p>
					</td>
				</tr>
			</table>			
			<hr width="80%" color="#e9ebee" align="left">
			<br>
			<h3><strong>승용차 이용 시</strong></h3>
			<hr width="80%" color="#e9ebee" align="left">
			<ul style="list-style: none; margin-bottom: 25px; text-align: left; padding: 0;">
				<li style="margin-bottom: 8px;"><strong style="color: #d65071; ">양재에서 오시는 길</strong>
				&nbsp; &nbsp;도곡역 남부순환로를 따라 매봉역을 지나면 우측 EBS 건물로 진입
				</li>
				<li><strong style="color: #d65071;">도곡에서 오시는 길</strong>
				&nbsp; &nbsp;매봉역 매봉터널 사거리를 지나 양재 방면으로 150M 직진하다가 U턴 후 진입
				</li>
			</ul>
			<ul class="list-dot lisdot" style="padding: 0;">
				<li>EBS 도곡동 사옥 지하 주차장 : 10분당 800원</li>
				<li>EBS 스페이스공감 티켓부스에서 주차 할인권을 수령하시면 3시간에 기본 요금 2000원으로 이용하실 수 있습니다. <br>
					(3시간 이후 부터는 일반 요금 적용)
				</li>
			</ul>
			<br>
			<ul class="list-dot lisdot" style="padding: 0;">
				<li>주차장은 요일제(5부제)로 시행됩니다. 요일 5부제(차량번호 끝자리) : 월(1,6) / 화(2,7) / 수(3,8) / 목(4,9) / 금(5,0) 주차 불가</li>
			</ul>
			<br>
			<ul class="list-dot lisdot" style="padding: 0;">
				<li>주차공간이 협소하오니 되도록 대중교통 이용을 부탁드립니다.</li>
				<li>강남일대의 교통을 고려할 때, 지하철로 오시는 방법이 가장 빠른 방법입니다.</li>
			</ul>
			<hr width="80%" color="#e9ebee" align="left">
			<br>
		</div>
	
	</div>
	<%@ include file="../common/footer.jsp"%>
</div>
</body>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=4567f8c7dfc2ca0d5930c854990d1816"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   				 mapOption = { 
        		center: new daum.maps.LatLng(37.486608, 127.047155), // 지도의 중심좌표
        		level: 3 // 지도의 확대 레벨
   				 };

				var map = new daum.maps.Map(mapContainer, mapOption);

				// 마커가 표시될 위치입니다 
				var markerPosition  = new daum.maps.LatLng(37.486608, 127.047155); 

				// 마커를 생성합니다
				var marker = new daum.maps.Marker({
    				position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);

				var iwContent = '<div style="padding:4px;">ebs 스페이스<br><a href="http://map.daum.net/link/map/ebs 스페이스,37.486608, 127.047155" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/ebs 스페이스,37.486608, 127.047155" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    				iwPosition = new daum.maps.LatLng(37.486608, 127.047155); //인포윈도우 표시 위치입니다

				// 인포윈도우를 생성합니다
				var infowindow = new daum.maps.InfoWindow({
   					position : iwPosition, 
    				content : iwContent 
				});
  
				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map); 
				</script>
				
	
</html>