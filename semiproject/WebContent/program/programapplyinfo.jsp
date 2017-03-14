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
<title>apply info</title>
<style type="text/css">
	.index {
		width: 100%;
		background-color: #f2f2f2;
		height: 70px;
	}
	.img-in {
		margin-top: 50px;
		margin-bottom: 50px;
	}
</style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<div class="container-fluid main-container" style="padding-left: 0; padding-right: 0;">		
	<div class="index">
		<div class="col-md-6 col-md-offset-2 ">
			<h3><strong>관람신청안내</strong></h3>
		</div>
	</div>
	<div class="container">
		<div class="img-in">
			<img alt="" src="/photoGallery/applyform.png">
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp"%>
</div>	

</body>
</html>