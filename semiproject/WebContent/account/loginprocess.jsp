<%@page import="util.MD5"%>
<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	UserDAO dao = new UserDAO();
	UserVO user = dao.getUserById(id);
	
	if (user == null) {
		response.sendRedirect("login.jsp?err=fail");
		return;
	}
	
	String secuPwd = MD5.hash(pwd);
	
	if (secuPwd.equals(user.getUserPwd())) {
		HttpSession session = request.getSession(true);
		session.setAttribute("LOGINED_USER", user);
		response.sendRedirect("/main.jsp");
		return;
	} else {
		response.sendRedirect("login.jsp?err=fail");
		return;
	}
%>