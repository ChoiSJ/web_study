<%@page import="dao.QnaDAO"%>
<%@page import="vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file="../common/header.jsp" %>
<%
	// 한글처리를 위한 인코딩 설정
	request.setCharacterEncoding("utf-8");
	
	int no = Integer.parseInt(request.getParameter("no"));
	int pno = Integer.parseInt(request.getParameter("pno"));
	String title = request.getParameter("title");
	String description = request.getParameter("description");
	
	// VO에 대입
	QnaVO qna = new QnaVO();
	qna.setTitle(title);
	qna.setContent(description);
	qna.setNo(no);
	
	QnaDAO dao = new QnaDAO();
	
	if(dao.getQnaByNo(no).getWriter().equals(user.getUserId())){
		dao.modifyQna(qna);
	}
	
	//수정완료시 작성글로이동.
	response.sendRedirect("detail.jsp?tno="+no+"&pno="+pno);
%>