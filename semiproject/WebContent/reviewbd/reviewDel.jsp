<%@page import="dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	int reviewNo = Integer.parseInt(no);
	ReviewDAO rdao = new ReviewDAO();
	rdao.delReview1(reviewNo);
	
	response.sendRedirect("reviewList.jsp");
%>