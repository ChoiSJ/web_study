<%@page import="vo.UserVO"%>
<%@page import="dao.noticeDAO"%>
<%@page import="vo.noticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	String imp = request.getParameter("impchk");

	noticeVO notice = new noticeVO();
	notice.setTitle(title);
	notice.setContent(content);
	notice.setWriter(writer);
	notice.setImp(imp);

	noticeDAO dao = new noticeDAO();
	int seq = dao.getSeq();
	notice.setNo(seq);
	notice.setGno(seq);
	dao.addBlog(notice);
	
	response.sendRedirect("/admin/adminNoticeList.jsp");
%>