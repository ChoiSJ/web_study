<%@page import="vo.Song"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
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
<div class="container">
	<h1>demo1.jsp 에서 요청객체에 저장한 속성값 표현하기</h1>
	
	<h2>요청객체에 단순한 값을 저장한 경우: 정수, 실수, 불린, 문자열</h2>
	<p>팀명: ${team }</p>
	<p>팀명: ${requestScope.team }</p>
	
	<%
		String teamName = (String) request.getAttribute("team");
	%>
	<p>팀명: <%=teamName %></p>
	
	<h2>요청객체에 배열객체를 값으로 저장한 경우</h2>
	<p>멤버: ${members[0] } ${members[1] } ${members[2] } ${members[3] } ${members[4] }</p>
	
	<h2>요청객체에 List 객체를 값으로 저장한 경우: List 의 요소는 단순한 값이다.</h2>
	<p>앨범: ${albums[0] } ${albums[1] } ${albums[2] } ${albums[3] } ${albums[4] }</p>
	
	<h2>요청객체에 VO객체가 값으로 저장</h2>
	<p>곡정보: ${song }</p>
	<p>곡명: ${song.title }	${song['title'] }</p>
	<p>곡명: <%=((Song) request.getAttribute("song")).getTitle() %></p>
	<p>아티스트: ${song.artist.name } ${song.artist.company } ${song.artist.age }</p>
	<p>런닝타임: ${song.runningTime } ${song.runningTime2 }</p>
	<p>발매사: ${song.company }</p>
	
	<h2>요청객체에 Map 객체가 값으로 저장된 경우</h2>
	<p>영화정보</p>
	<p>제목: ${movie['title'] }</p>
	<p>주연배우: ${movie.actor }</p>
	<p>감독: ${movie.director }</p>
	<p>장르: ${movie.genre }</p>
	<p>런닝타임: ${movie['running-time'] }</p>
</div>
</body>
</html>