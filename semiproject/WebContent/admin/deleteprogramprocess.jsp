<%@page import="dao.ProgramDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<% 
	String[] dnoArr = request.getParameterValues("dno");
	ProgramDAO dao = new ProgramDAO();
	
	if (dnoArr == null) {
		response.sendRedirect("programmodifylist.jsp");
		return;
	}
	
	for (String dno : dnoArr) {
		int dnoToInt = Integer.parseInt(dno);
		
		dao.deleteProgram(dnoToInt);
	}
	
	response.sendRedirect("programmodifylist.jsp");
%>