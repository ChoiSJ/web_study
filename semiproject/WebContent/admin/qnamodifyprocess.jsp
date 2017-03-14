<%@page import="vo.QnaVO"%>
<%@page import="dao.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	int no = Integer.parseInt(request.getParameter("mno"));
	String[] rnoArr = request.getParameterValues("rno");
	
	QnaDAO dao = new QnaDAO();
	QnaVO qna = new QnaVO();
	qna.setTitle(title);
	qna.setContent(content);
	qna.setWriter(writer);
	qna.setNo(no);
	
	dao.modifyQna(qna);
	
	if (rnoArr != null) {
		for (int i=0; i<rnoArr.length; i++) {
			int rnoToInt = Integer.parseInt(rnoArr[i]);
			
			dao.updateReplyByNo(rnoToInt, no);
		}
	}
	
	response.sendRedirect("/admin/qnamodify.jsp?mno="+no);
%>