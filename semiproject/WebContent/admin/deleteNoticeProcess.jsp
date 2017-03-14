<%@page import="dao.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	String[] dnoArr = request.getParameterValues("dno");
	noticeDAO dao = new noticeDAO();	
	
	if (dnoArr == null) {
		response.sendRedirect("adminNoticeList.jsp?pno=1");
		return;
	}

	for (String dno : dnoArr) {
		int dnoToInt = Integer.parseInt(dno);
		
		dao.deleteNotice(dnoToInt);
	}
	
	response.sendRedirect("adminNoticeList.jsp?pno=1");
%>