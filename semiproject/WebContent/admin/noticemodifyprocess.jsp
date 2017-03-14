<%@page import="dao.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");	

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int no = Integer.parseInt(request.getParameter("mno"));
	
	noticeDAO dao = new noticeDAO();
	dao.modifyNotice(title, content, no);
	
	response.sendRedirect("adminNoticeList.jsp?pno=1");
%>