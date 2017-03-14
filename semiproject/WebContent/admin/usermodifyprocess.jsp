<%@page import="dao.UserDAO"%>
<%@page import="vo.UserVO"%>
<%@page import="util.MD5"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String newPwd = MD5.hash(request.getParameter("newpwd"));
	String chkNewPwd = MD5.hash(request.getParameter("chknewpwd"));
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String tel = request.getParameter("tel");
	int no = Integer.parseInt(request.getParameter("no"));

	UserVO user = new UserVO();
	user.setUserId(id);
	user.setUserName(name);
	user.setUserBirth(birth);
	user.setUserTel(tel);
	user.setUserNo(no);
	
	UserDAO dao = new UserDAO();
	dao.updateUser(user);

	if (newPwd.equals(chkNewPwd)) {
		
		user.setUserPwd(newPwd);
		user.setUserId(id);
		
		dao.updateUserPwd(user);
		
	}
	
	response.sendRedirect("/admin/userlist.jsp");
%>