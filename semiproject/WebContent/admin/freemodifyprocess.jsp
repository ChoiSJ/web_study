<%@page import="vo.FreeVO"%>
<%@page import="dao.FreeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<% 
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	int no = Integer.parseInt(request.getParameter("mno"));
	String[] rnoArr = request.getParameterValues("rno");
	
	FreeDAO dao = new FreeDAO();
	FreeVO free = new FreeVO();
	free.setTitle(title);
	free.setContent(content);
	free.setWriter(writer);
	free.setNo(no);
	
	dao.modifyFree(free);
	
	if (rnoArr != null) {
		for (int i=0; i<rnoArr.length; i++) {
			int rnoToInt = Integer.parseInt(rnoArr[i]);
			
			dao.updateReplyByNo(rnoToInt, no);
		}
	}
	
	response.sendRedirect("http://localhost/admin/freemodify.jsp?mno="+no+"");
%>