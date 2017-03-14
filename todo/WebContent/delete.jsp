<%@page import="dao.TodoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<% 
	int no = Integer.parseInt(request.getParameter("tno"));
	int pageNo = Integer.parseInt(request.getParameter("pno"));

	TodoDAO dao = new TodoDAO();
	dao.deleteTodo(no);
	
	response.sendRedirect("list.jsp?pno=" + pageNo);
%>