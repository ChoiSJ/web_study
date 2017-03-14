<%@page import="dao.UserDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="vo.UserVO"%>
<%@page import="util.MD5"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String tel = request.getParameter("tel");
	
	String secuPwd = MD5.hash(pwd);
	
	UserVO user = new UserVO();
	user.setUserId(id);
	user.setUserPwd(secuPwd);
	user.setUserName(name);
	user.setUserBirth(birth);
	user.setUserTel(tel);
	
	UserDAO dao = new UserDAO();
	dao.addUser(user);
	
	response.sendRedirect("login.jsp");
%>