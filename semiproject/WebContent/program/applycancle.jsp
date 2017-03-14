<%@page import="dao.ProgramApplyDAO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");

	HttpSession session = request.getSession(false);
	UserVO user = null;
	boolean isLogined = false;
	if (session != null) {
		user = (UserVO) session.getAttribute("LOGINED_USER");
		if (user != null) {
			isLogined = true;
		}
	}
	
	int applyNo = Integer.parseInt(request.getParameter("ano"));
	
	ProgramApplyDAO dao = new ProgramApplyDAO();
	dao.removeApply(applyNo);
	
	response.sendRedirect("/program/checkapply.jsp");
%>