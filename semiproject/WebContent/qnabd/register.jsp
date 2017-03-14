<%@page import="dao.QnaDAO"%>
<%@page import="vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file="../common/header.jsp" %>
<%
	// 한글처리를 위한 인코딩 설정
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String description = request.getParameter("description");
	
	// VO에 대입
	QnaVO qna = new QnaVO();
	qna.setTitle(title);
	qna.setContent(description);
	qna.setWriter(user.getUserId());
	
	QnaDAO dao = new QnaDAO();
	dao.addQna(qna);
	response.sendRedirect("qnalist.jsp?pno=1");
%>