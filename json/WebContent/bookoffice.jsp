<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$("#search-btn").click(function(event) {
			event.preventDefault();
			var searchDate = $("#search-date").val();
			
			if (searchDate) {
				searchDate = searchDate.replace(/-/g, '');

				var xhr = new XMLHttpRequest();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						//var xmlText = xhr.responseText;
						//var xmlDoc = $.parseXML(xmlText);
						var xmlDoc = xhr.responseXML;
						var htmlContent = "";
						console.log(xmlDoc);
						$(xmlDoc).find("dailyBoxOffice").each(function(index, item) {
							var rank = $(item).find("rank").text();
							var name = $(item).find("movieNm").text();
							var openDate = $(item).find("openDt").text();
							var salesShare = $(item).find("salesShare").text();
							var audiCnt = $(item).find("audiAcc").text();
							
							htmlContent += "<tr>";
							htmlContent += "<td>"+rank+"</td>";
							htmlContent += "<td>"+name+"</td>";
							htmlContent += "<td>"+openDate+"</td>";
							htmlContent += "<td>"+salesShare+"</td>";
							htmlContent += "<td>"+audiCnt+"</td>";
							htmlContent += "</tr>";
						})
						
						$("tbody").html(htmlContent);
						
						/*
						var jsonText = xhr.responseText;
						console.log(jsonText);
						var boxoffice = JSON.parse(jsonText);
						var boxofficeList = boxoffice.boxOfficeResult.dailyBoxOfficeList;
						var htmlContent = "";
						
						for (var i=0; i<boxofficeList.length; i++) {
							var movie = boxofficeList[i];
							htmlContent += "<tr>"
							htmlContent += "<td>"+movie.rank+"</td>"
							htmlContent += "<td>"+movie.movieNm+"</td>"
							htmlContent += "<td>"+movie.openDt+"</td>"
							htmlContent += "<td>"+movie.salesShare+"</td>"
							htmlContent += "<td>"+movie.audiAcc+"</td>"
							htmlContent += "</tr>"
						}
						
						$("tbody").html(htmlContent);
						*/
					}
				}
				xhr.open("GET", "boxoffice?date=" + searchDate);
				xhr.send();
			}
		})
	})  	
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>일일 박스오피스 조회</h1>
	
	<div class="row well">
		<form class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-xs-1">날짜</label>
				<div class="col-xs-9">
					<input type="date" class="form-control" id="search-date">
				</div>
				<div class="col-xs-2">
					<button class="btn btn-success" id="search-btn">조회</button>
				</div>
			</div>
		</form>
	</div>
	
	<table class="table">
		<thead>
			<tr>
				<th>순위</th>
				<th>제목</th>
				<th>개봉일</th>
				<th>티켓예매율</th>
				<th>누적관객수</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
</div>
</body>
</html>