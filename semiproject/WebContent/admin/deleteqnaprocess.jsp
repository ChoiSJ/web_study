<%@page import="dao.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	String[] dnoArr = request.getParameterValues("dno");
	QnaDAO dao = new QnaDAO();
	
	if (dnoArr == null) {
		response.sendRedirect("adminqnalist.jsp?pno=1");
	}
	
	for (String dno : dnoArr) {
		int dnoToInt = Integer.parseInt(dno);
		
		dao.deleteQna(dnoToInt);
	}
	
		response.sendRedirect("adminqnalist.jsp?pno=1");	
%>