<%@page import="dao.QnaDAO"%>
<%@page import="vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file="../common/header.jsp" %>
<%
	// 한글처리를 위한 인코딩 설정
	request.setCharacterEncoding("utf-8");
	int qnaNo = Integer.parseInt(request.getParameter("tno"));
	int wordNo = Integer.parseInt(request.getParameter("localno"));
	int pageNo = Integer.parseInt(request.getParameter("pno"));

	QnaDAO dao = new QnaDAO();
	if(dao.getQnaReply(qnaNo).getWriter().equals(user.getUserId())){
		dao.deleteQnaReply(qnaNo);
	}
	response.sendRedirect("detail.jsp?tno="+ wordNo +"&pno=" + pageNo);
%>