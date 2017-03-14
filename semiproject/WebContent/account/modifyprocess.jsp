<%@page import="org.apache.catalina.User"%>
<%@page import="dao.UserDAO"%>
<%@page import="vo.UserVO"%>
<%@page import="util.MD5"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	HttpSession session = request.getSession(false);

	if (session == null) {
		response.sendRedirect("main.jsp");
		return;
	}

	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = MD5.hash(request.getParameter("pwd"));
	String hdpwd = request.getParameter("hdpwd");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String tel = request.getParameter("tel");
	int no = Integer.parseInt(request.getParameter("no"));
	
	if (pwd.equals(hdpwd)) {
		
		UserVO user = new UserVO();
		user.setUserId(id);
		user.setUserName(name);
		user.setUserBirth(birth);
		user.setUserTel(tel);
		user.setUserNo(no);
		
		UserDAO dao = new UserDAO();
		dao.updateUser(user);
		
		session.setAttribute("LOGINED_USER", dao.getUserById(id));
		
		response.sendRedirect("/main.jsp");
	} else {
		response.sendRedirect("/account/modify.jsp");
	}
%>