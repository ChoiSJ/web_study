<%@page import="dao.FreeDAO"%>
<%@page import="vo.FreeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file="../common/header.jsp" %>
<%
	// 한글처리를 위한 인코딩 설정
	request.setCharacterEncoding("utf-8");
	
	int no = Integer.parseInt(request.getParameter("no"));
	int gno = Integer.parseInt(request.getParameter("gno"));
	int pno = Integer.parseInt(request.getParameter("pno"));
	String title = request.getParameter("title");
	String description = request.getParameter("description");
	
	FreeDAO dao = new FreeDAO();
	
	if(dao.getFreeByNo(no).getWriter().equals(user.getUserId())){
		// VO에 대입
		FreeVO free = new FreeVO();
		free.setTitle(title);
		free.setContent(description);
		free.setNo(no);
		free.setGno(gno);
		
		dao.modifyFree(free);
	}
	
	//수정완료시 작성글로이동.
	response.sendRedirect("detail.jsp?tno="+no+"&pno="+pno);
%>