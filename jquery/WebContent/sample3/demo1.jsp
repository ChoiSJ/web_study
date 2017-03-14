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
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
    $('#search-btn').click(function(e){
       e.preventDefault();
       $.ajax({
          type:"GET",
          url:'https://apis.daum.net/search/book',
          data:$('#search-form').serialize(),
          dataType:'jsonp',
          jsonp:'callback',
          success:function(data){
             var $tbody = $('tbody').empty();
             
             $.each(data.channel.item, function(index,item){
                var $tr = $('<tr></tr>');
                $tr.append("<td><img src='"+item.cover_s_url+"'/></td>");
                $tr.append("<td><a href='"+item.link+"' target='_blank' data-toggle='tooltip' title='"+item.description+"''>"+item.title+"</td>");
                $tr.append("<td>"+item.author+"</td>");
                $tr.append("<td>"+item.pub_nm+"</td>");
                $tr.append("<td>"+item.list_price+"</td>");
                $tr.append("<td>"+item.status_des+"</td>");
                
                $tbody.append($tr);
             });
             
          },
          error:function(xhr) {
                
             }
       });
    });
});
</script>
</head>
<body>
<div class="container">
	<h1>책 검색</h1>
	<div class="row well">
		<form>
			<input type="hidden" name="apikey" value="320282405334b1da6930dea1cfbc2627">
			<div class="form-group">
				<label>검색어</label>
				<input type="text" class="form-control" name="q">
			</div>
			<div class="form-group">
				<label>출력 갯수(최대 20개)</label>
				<input type="text" class="form-control" name="result">
			</div>
			<div class="form-group">
				<label>정렬순서</label>
				<select name="sort" class="form-control">
					<option value="popular">판매량순</option>
					<option value="accu">정확도순</option>
					<option value="date">최신자료순</option>
				</select>
			</div>
			<div class="form-group">
				<label>검색유형</label>
				<select name="searchType" class="form-control">
					<option value="all">전체</option>
					<option value="title">제목</option>
					<option value="keyword">주제어</option>
					<option value="overview">책소개</option>
					<option value="publisher">출판사</option>
				</select>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-info">검색</button>
			</div>
		</form>
	</div>
    <div class="row">
        <table class="table table-condensed">
           <thead>
              <tr>
                 <th>표지</th>
                 <th>제목</th>
                 <th>저자</th>
                 <th>출판사</th>
                 <th>가격</th>
                 <th>상태</th>
              </tr>
           </thead>
           <tbody></tbody>
        </table>
	</div>
</div>
</body>
</html>