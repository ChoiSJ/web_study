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
	
	String oldPwd = MD5.hash(request.getParameter("oldpwd"));
	String hiddenPwd = request.getParameter("hiddenpwd");
	String newPwd = MD5.hash(request.getParameter("newpwd"));
	String chkNewPwd = MD5.hash(request.getParameter("chknewpwd"));
	String id = request.getParameter("id");

	if (oldPwd.equals(hiddenPwd)) {
		if (newPwd.equals(chkNewPwd)) {
			
			UserVO user = new UserVO();
			user.setUserPwd(newPwd);
			user.setUserId(id);
			
			UserDAO dao = new UserDAO();
			dao.updateUserPwd(user);
			
			session.setAttribute("LOGINED_USER", dao.getUserById(id));
			
			response.sendRedirect("/main.jsp");
		}
	} else {
		response.sendRedirect("account/passwordmodify.jsp");
	}
%>