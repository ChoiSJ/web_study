<%@page import="dao.FreeDAO"%>
<%@page import="vo.FreeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file="../common/header.jsp" %>
<%
	// 한글처리를 위한 인코딩 설정
	request.setCharacterEncoding("utf-8");
	int freeNo = Integer.parseInt(request.getParameter("tno"));
	int wordNo = Integer.parseInt(request.getParameter("gno"));
	int pageNo = Integer.parseInt(request.getParameter("pno"));
	
	FreeDAO dao = new FreeDAO();
	if(dao.getFreeByNo(freeNo).getWriter().equals(user.getUserId())){
		dao.deleteFree(freeNo);  
	}
	response.sendRedirect("detail.jsp?tno="+ wordNo +"&pno=" + pageNo);
%>