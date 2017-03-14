<%@page import="dao.ReviewDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int dno = Integer.parseInt(request.getParameter("dno"));
	new ReviewDAO().delReview1(dno);
%>