<%@page import="dao.ReviewDAO"%>
<%@page import="vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");
	String program = request.getParameter("programname");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String userid = request.getParameter("userid");
	String username = request.getParameter("username");
	String filename = request.getParameter("file");
	String score = request.getParameter("score");
	
	ReviewVO rvo = new ReviewVO();
	rvo.setProgramName(program);
	rvo.setTitle(title);
	rvo.setContent(content);
	rvo.setUserId(userid);
	rvo.setUserName(username);
	rvo.setFileName(filename);
	rvo.setScore(Integer.parseInt(score));
	
	ReviewDAO rdao = new ReviewDAO();
	rdao.addReview(rvo);
	response.sendRedirect("reviewList.jsp");
%>