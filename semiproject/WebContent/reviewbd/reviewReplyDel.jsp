<%@page import="dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");
	int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
	int pageNo = Integer.parseInt(request.getParameter("pageNo"));
	int reNo = Integer.parseInt(request.getParameter("replyNo"));
	ReviewDAO rdao = new ReviewDAO();
	rdao.delReviewReply(reNo);
	response.sendRedirect("reviewDetail.jsp?no="+reviewNo+"&pno="+pageNo);
%>