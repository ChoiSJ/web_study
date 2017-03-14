<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 가입폼</h1>
	<form action="register.jsp" method="post">
		이름:<br/>
		<input type="text" name="username"/><br/>
		전화번호:<br/>
		<input type="text" name="userphone"/><br/>
		<input type="submit" value="등록"/>
	</form>
</body>
</html>