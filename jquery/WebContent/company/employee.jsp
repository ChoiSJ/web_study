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
		$('#emp-table').hide();
		
		$('#emp-list').on('click', 'li', function(){
			
			// 통일된 id를 입력해 replace를 통해 id가 어떤것인지 쉽게 판단할수 있게 id를 지정해준후 emp-를 공백으로 바꾸고 번호만 나오게 한다.
			var empId = $(this).attr('id').replace('emp-','');
			$('#emp-list li').removeClass('active');
			$(this).addClass('active');
			
			$.ajax({
				type:'get',
				// 지정경로에 get방식의 쿼리스트링의 name으로 id value로 empId 의 번호를 입력해 요청url로 보내준다.
				url:'../emp?id='+empId,
				
				success:function(data){
					
					// 객체형태
					// 객체형태는 바로바로 사용할수 있음으로 그안에 값을 바로지정해준다.
					// $('td:eq(index)')를 지정해주면 지정한 index에 있는 td를 반환한다.
					$('td:eq(0)').text(data.id);
					$('td:eq(1)').text(data.firstName + "," + data.lastName);
					$('td:eq(2)').text(data.phone);
					$('td:eq(3)').text(data.jobId);
					$('td:eq(4)').text(data.salary);
					$('td:eq(5)').text(data.commission);
					
					$('#emp-table').show();
				}
			});
			
		});
		
		$("#dept-list").on('click', 'li', function(){
			var deptId = $(this).attr('id').replace('dept-','');
			
			$('#dept-list li').removeClass('active');
			$(this).addClass('active');
			
			$.ajax({
				type:"get",
				url:"../emps?id="+deptId,
						
				success:function(data){
					
					$('#emp-list').empty();
					
					// 배열형태
					// 배열의 형태는 $.each함수를 통해 값을 꺼낸다.
					$.each(data,function(index,item){
						
						var $li = $('<li class="list-group-item"></li>');
						$li.attr('id','emp-'+item.id);
						$li.text(item.firstName + " " + item.lastName);
						$('#emp-list').append($li);
						
					});
					
				}
			});
		});
		
		$.ajax({
			type:"get",
			url:"../depts",
			success: function(data){
				$.each(data,function(index, item){
					
					// jQuery에 생성자함수를 통헤 $li에 li태그를 생성한다.
					var $li = $('<li class="list-group-item"></li>');
					$li.attr("id", "dept-" + item.id);
					$li.text(item.name);
					$('#dept-list').append($li);
				});
			}
		})
	})
</script>
</head>
<body>
	<div class="container">
		<h1>사원 정보 조회</h1>
		<div class="row">
			<div class="col-xs-4" style="height:400px; overflow:auto;">
				<h3>부서 리스트</h3>
				<ul id="dept-list" class="list-group"></ul>
			</div>
			<div class="col-xs-4" style="height:400px; overflow:auto;">
				<h3>사원 리스트</h3>
				<ul id="emp-list" class="list-group"></ul>
			</div>
			<div class="col-xs-4">
				<h3>사원 정보</h3>
				<table id="emp-table" class="table table-bordered">
					<colgroup>
						<col width="30%">
						<col width="*">
					</colgroup>
						<tr>
							<th>사원 아이디</th>
							<td></td>
						</tr>
						<tr>
							<th>이름</th>
							<td></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td></td>
						</tr>
						<tr>
							<th>업무</th>
							<td></td>
						</tr>
						<tr>
							<th>급여</th>
							<td></td>
						</tr>
						<tr>
							<th>커미션</th>
							<td></td>
						</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>