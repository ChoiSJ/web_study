<%@page import="util.MD5"%>
<%@page import="dao.UserDAO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	// 한글처리를 위한 인코딩 설정
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	
	// 비밀번호 암호화하기
	String secuPwd = MD5.hash(pwd);
	
	UserVO user = new UserVO();
	user.setId(id);
	user.setPwd(secuPwd);
	user.setName(name);
	user.setPhone(phone);
	user.setAddr(addr);
	
	UserDAO dao = new UserDAO();
	dao.addUser(user);
	
	response.sendRedirect("main.jsp");
%>