<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>sample</title>
<script type="text/javascript">
	$(function() {
		$('#search-btn').click(function(e) {
			e.preventDefault();
			
			var departure = $("#start-station").val();
			var arrival = $("#end-station").val();
			if (departure && arrival) {
				
				$.ajax({
					type:"post",
					url:"../quick",
					
					// 요청을 보낼때 데이터의 값을 객체의 형태로 보내 name : value로 지정한후 보낸다.
					data:{d:departure, a:arrival},
					success:function(data){
						
						var route = data.shortestRouteList[0];
						
						var shtTimeStation = route.shtStatnNm;
						var shtTimeMsg = route.shtTransferMsg;
						
						var minTransStation = route.minStatnNm;
						var minTransMsg = route.minTransferMsg;
						
						$('#sht-time-body').empty();
						
						var htmlContent = "<ul class='list-group'>";
						
						$.each(shtTimeStation.split(","), function(index, item) {
							
							htmlContent += "<li class='list-group-item text-center'>"+item+"</li>";
							
						});
						
						htmlContent += "</ul>";
						
						//////////////////////////////////////////////////////////////////////////
						
						$('#sht-time-body').html(htmlContent);
						$('#sht-time-footer').text(shtTimeMsg);
						
						$('#sht-trans-body').empty();
						
						var htmlContent2 = "<ul class='list-group'>";
						
						$.each(minTransStation.split(","), function(index, item){
							
							htmlContent2 += "<li class='list-group-item text-center'>"+item+"</li>";
							
						});
						
						htmlContent2 += "</ul>";
						
						$('#sht-trans-body').html(htmlContent2);
						$('#sht-trans-footer').text(minTransMsg);
						
					}
				});
			}
			
		});
		
		
		$('#start-line, #end-line').change(function() {
			// 선택한 selectBox의 option value를 읽어 lineNumber에 담는다.
			var lineNumber = $(this).val();
			// 선택된 selectBox의 id를 line을 읽어와 station으로 읽어오면 selectBox다음에 있는 selectBox의 아이디를 읽어올수 있어서 replace를 한다.
			var selectedBoxId = $(this).attr('id').replace('line','station');
			
			// selectBox의 option value가 " "이 아닐경우 실행할 제어문
			if (lineNumber != "") {
				$.ajax({
					type:"get",
					// 요청 경로 뒤에 lineNumber를 붙혀 lineNumber에 해당하는 역의 이름데이터를 조회한다.
					url:"../subway?line="+lineNumber,
					success: function(data){
						// 데이터를 보여주기전에 selectBox에 있던 데이터를 삭제 해준후
						$('#'+selectedBoxId).empty();
						// for문 (반복문) each를 활용해 json객체에 row 안에 있는 STATION_NM 을 불러오면 역의 이름을 불러올수있다.
						$.each(data.SearchSTNBySubwayLineService.row,function(index,item){
							var option = "<option>"+item.STATION_NM+"</option>";
							// 위에서 설정한 selectedBox에 읽어온 데이터에 역의 이름을 붙혀서 내부에 option태그를 생성해 만든다.
							$('#'+selectedBoxId).append(option);
						});
					}
				});
			}
		});
	})
</script>
</head>
<body>
	<div class="container">
		<h1>지하철 최단경로 조회하기</h1>
		
		<div class="row well">
			<form class="form-horizontal">
				<div class="form-group">
					<label class="control-label col-xs-1">출발역</label>
					<div class="col-xs-2">
						<select id="start-line" class="form-control">
							<option value="">선택하세요</option>
							<option value="1">1호선</option>
							<option value="2">2호선</option>
							<option value="3">3호선</option>
							<option value="4">4호선</option>
							<option value="5">5호선</option>
							<option value="6">6호선</option>
							<option value="7">7호선</option>
							<option value="8">8호선</option>
							<option value="9">9호선</option>
							<option value="I">인천1호선</option>
							<option value="K">경의중앙선</option>
							<option value="B">분당선</option>
							<option value="A">공항철도</option>
							<option value="G">경춘선</option>
							<option value="S">신분당선</option>
							<option value="SU">수인선</option>
						</select>
					</div>
					<div class="col-xs-2">
						<select id="start-station" class="form-control">
							
						</select>
					</div>
					<label class="control-label col-xs-1">도착역</label>
					<div class="col-xs-2">
						<select id="end-line" class="form-control">
							<option value="">선택하세요</option>
							<option value="1">1호선</option>
							<option value="2">2호선</option>
							<option value="3">3호선</option>
							<option value="4">4호선</option>
							<option value="5">5호선</option>
							<option value="6">6호선</option>
							<option value="7">7호선</option>
							<option value="8">8호선</option>
							<option value="9">9호선</option>
							<option value="I">인천1호선</option>
							<option value="K">경의중앙선</option>
							<option value="B">분당선</option>
							<option value="A">공항철도</option>
							<option value="G">경춘선</option>
							<option value="S">신분당선</option>
							<option value="SU">수인선</option>
						</select>
					</div>
					<div class="col-xs-2">
						<select id="end-station" class="form-control">
							
						</select>
					</div>
					<div class="col-xs-2">
						<button id="search-btn" type="submit" class="btn btn-primary">조회</button>
					</div>
				</div>
			</form>
		</div>
		<div class="row">
			<div class="col-xs-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">최단시간 경로</h3>
					</div>
					<div class="panel-body" id="sht-time-body"></div>
					<div class="panel-footer" id="sht-time-footer"></div>
				</div>
			</div>
			<div class="col-xs-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">최소환승 경로</h3>
					</div>
					<div class="panel-body" id="sht-trans-body"></div>
					<div class="panel-footer" id="sht-trans-footer"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>