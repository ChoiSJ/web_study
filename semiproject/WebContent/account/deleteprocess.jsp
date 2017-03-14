<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	int no = Integer.parseInt(request.getParameter("uno"));

	UserDAO dao = new UserDAO();
	dao.deleteUser(no);
	
	HttpSession session = request.getSession(false);
	session.invalidate();
	
	response.sendRedirect("/main.jsp");
%>