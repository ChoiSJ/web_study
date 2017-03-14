<%@page import="dao.noticeDAO"%>
<%@page import="vo.noticeReVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String noticeno = request.getParameter("noticeno");
	int ntno = Integer.parseInt(noticeno);
	String userid = request.getParameter("userid");
	String username = request.getParameter("username");
	String pageNo = request.getParameter("pageno");
	
	noticeReVO rvo = new noticeReVO();
	noticeDAO rdao = new noticeDAO();
	rvo.setNo(ntno);
	rvo.setUserId(userid);
	rvo.setUserName(username);
	rvo.setContent(title);
	rdao.addReply(rvo);
	

	response.sendRedirect("noticedetail.jsp?no="+noticeno+"&pno="+pageNo);
	/* response.sendRedirect("noticeList.jsp"); */
%>