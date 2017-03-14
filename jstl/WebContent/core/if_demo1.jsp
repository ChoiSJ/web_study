<%@page import="java.util.Date"%>
<%@page import="vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<% 
	request.setAttribute("score", 98);

	Book book1 = new Book(100, "이것이 자바다", "신용권", "한빛미디어", 35000, new Date());
	request.setAttribute("book1", book1);
	
	Book book2 = new Book(102, "토비의 스프링", "이일민", "에이콘출판사", 75000, new Date());
	request.setAttribute("book2", book2);
	
	request.getRequestDispatcher("if_demo2.jsp").forward(request, response);
%>