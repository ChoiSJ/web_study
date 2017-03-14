<%@page import="dao.FreeDAO"%>
<%@page import="vo.FreeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file="../common/header.jsp" %>
<%
	// 한글처리를 위한 인코딩 설정
	request.setCharacterEncoding("utf-8");

	String reply = request.getParameter("reply");
	int freeNo = Integer.parseInt(request.getParameter("tno"));
	int pageNo = Integer.parseInt(request.getParameter("pno"));
	
	// VO에 대입
	FreeVO free = new FreeVO();
	free.setContent(reply);
	free.setWriter(user.getUserId());
	free.setGno(freeNo);
	
	FreeDAO dao = new FreeDAO();
	dao.addReply(free); 
	response.sendRedirect("detail.jsp?tno="+freeNo+"&pno="+pageNo);
%>