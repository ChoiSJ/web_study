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
	int reviewNo = Integer.parseInt(request.getParameter("reviewno"));
	int pageNo = Integer.parseInt(request.getParameter("pageno"));
	
	ReviewVO rvo = new ReviewVO();
	ReviewDAO rdao = new ReviewDAO();
	rvo.setNo(reviewNo);
	rvo.setProgramName(program);
	rvo.setTitle(title);
	rvo.setContent(content);
	rvo.setUserId(userid);
	rvo.setUserName(username);
	rvo.setFileName(filename);
	rvo.setScore(Integer.parseInt(score));
	
	rdao.reviewEdit(rvo);
	response.sendRedirect("reviewDetail.jsp?no="+reviewNo+"&pno="+pageNo);
%>