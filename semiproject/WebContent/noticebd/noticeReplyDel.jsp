<%@page import="dao.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	/* 미구현 */
	request.setCharacterEncoding("utf-8");
	int noticeno = Integer.parseInt(request.getParameter("noticeno"));
	int pageNo = Integer.parseInt(request.getParameter("pageno"));
	int reNo = Integer.parseInt(request.getParameter("replyNo"));
	noticeDAO deldao = new noticeDAO();
	deldao.delnoticeReply(reNo);
	response.sendRedirect("noticedetail.jsp?no="+noticeno+"&pno="+pageNo);
%>