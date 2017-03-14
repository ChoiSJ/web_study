<%@page import="dao.QnaDAO"%>
<%@page import="vo.QnaReplyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file="../common/header.jsp" %>
<%
	// 한글처리를 위한 인코딩 설정
	request.setCharacterEncoding("utf-8");

	String reply = request.getParameter("reply");
	int qnaReplyNo = Integer.parseInt(request.getParameter("tno"));
	int pageNo = Integer.parseInt(request.getParameter("pno"));
	
	QnaDAO dao = new QnaDAO();
	
	QnaReplyVO qnaReply = dao.getQnaReply(qnaReplyNo);
	
	if(qnaReply != null){
		
		qnaReply.setContent(reply);
		dao.modifyQnaReply(qnaReply);
		
	} else {
	
		// VO에 대입
		qnaReply = new QnaReplyVO();
		qnaReply.setContent(reply);
		qnaReply.setWriter(user.getUserId());
		qnaReply.setLocalNo(qnaReplyNo);
		dao.addQnaReply(qnaReply);
		
	}
	response.sendRedirect("detail.jsp?tno="+qnaReplyNo+"&pno="+pageNo);
%>