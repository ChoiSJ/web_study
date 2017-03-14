<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	pageContext.setAttribute("p", "페이지스코프의 값입니다.");
	request.setAttribute("r", "요청스코프의 값입니다.");
	session.setAttribute("s", "세션스코프의 값입니다.");
	application.setAttribute("a", "애플리케이션스코프의 값입니다.");
	
	// 페이지 이동 - redirect 이동
	//response.sendRedirect("b.jsp");
	
	// 페이지 이동 - forward 이동
	RequestDispatcher rd = request.getRequestDispatcher("b.jsp");
	rd.forward(request, response);
%>