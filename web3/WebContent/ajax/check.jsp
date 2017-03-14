<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>
<%
	// 중복여부를 검사할 아이디를 
	String userId = request.getParameter("userid");
	System.out.println("중복여부를 검사할 아이디:" + userId);
	
	// 중복여부를 검사하기
	String duplicated = "N";
	if ("hong".equals(userId)) {
		duplicated = "Y";
	}
	
	// 중복여부를 Y/N 으로 전달하기
	out.write(duplicated);
%>