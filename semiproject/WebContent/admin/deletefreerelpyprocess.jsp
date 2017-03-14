<%@page import="java.io.PrintWriter"%>
<%@page import="dao.FreeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<% 
	int dno = Integer.parseInt(request.getParameter("dno"));
	int mno = Integer.parseInt(request.getParameter("mno"));

	FreeDAO dao = new FreeDAO();
	dao.deleteFree(dno);
	response.sendRedirect("http://localhost/admin/freemodify.jsp?mno="+mno+"");
%>
