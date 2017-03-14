<%@page import="dao.FreeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	String[] dnoArr = request.getParameterValues("dno");
	FreeDAO dao = new FreeDAO();
	
	if (dnoArr == null) {
		response.sendRedirect("adminfreelist.jsp?pno=1");
		return;
	}
	
	for (String dno : dnoArr) {
		int dnoToInt = Integer.parseInt(dno);
		
		dao.deleteFree(dnoToInt);
	}
	
	response.sendRedirect("adminfreelist.jsp?pno=1");
%>