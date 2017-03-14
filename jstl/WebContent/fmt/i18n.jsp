<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<fmt:bundle basename="bundle.message">
	<fmt:message key="login.hint.id" var="idhint"/>
	<fmt:message key="login.hint.pwd" var="pwdhint"/>	
	
	<div class="container">
		<h1><fmt:message key="login.title"/></h1>
		<form method="post" action="login.jsp">
			<div class="form-group">
				<label><fmt:message key="login.label.id"/></label>
				<input type="text" class="form-control" name="userid" placeholder="${idhint }">
			</div>
			<div class="form-group">
				<label><fmt:message key="login.label.pwd"/></label>
				<input type="text" class="form-control" name="userpwd" placeholder="${pwdhint }">
			</div>
			<div class="form-group">
				<button class="btn btn-default"><fmt:message key="login.btn"/></button>
			</div>
		</form>
	</div>
</fmt:bundle>
</body>
</html>