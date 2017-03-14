<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProgramApplyDAO"%>
<%@page import="vo.ProgramApplyVO"%>
<%@page import="vo.ProgramVO"%>
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
	
	
	
	/*
	ProgramDAO dao = new ProgramDAO();
	ProgramVO program = dao.getProgramByNo(no);
	*/
	String userId = user.getUserId();
	System.out.println(userId);
	int programNo = Integer.parseInt(request.getParameter("selectprogram"));
	System.out.println(programNo);
	String userStory = request.getParameter("reason");
	System.out.println(userStory);
	int countTicket = Integer.parseInt(request.getParameter("countticket"));
	System.out.println(countTicket);
	String applyTel = request.getParameter("applytel");
	System.out.println(applyTel);
	
	ProgramApplyVO apply = new ProgramApplyVO();
	apply.setUserId(userId);
	apply.setProgramNo(programNo);
	apply.setUserStory(userStory);
	apply.setCountTicket(countTicket);
	apply.setApplyTel(applyTel);
	
	ProgramApplyDAO dao = new ProgramApplyDAO();
	dao.addApplyProgram(apply);
	
	
	response.sendRedirect("/program/checkapply.jsp");
	
%>