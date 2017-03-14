<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<% 
	String kind = request.getParameter("kind");

	if ("kr".equals(kind)) {
		out.write("된장찌개,청국장,두부조김,김치찌개,부대찌개,뚝배기불고기,칼국수,매생이굴떡국");
	} else if ("ch".equals(kind)) {
		out.write("짜장면,짬뽕,탕수육,라조기,팔보채,유산슬,마파두부,깐풍기,간짜장");
	} else if ("jp".equals(kind)) {
		out.write("초밥,우동,라멘,오무라이스,돈까스,오코노미야끼,규동,돈부리,타코야키");
	}
%>