<%@page import="vo.FreeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.FreeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<% 
	request.setCharacterEncoding("utf-8");
	String seletedOption = request.getParameter("selected-option");
	String searchWord = request.getParameter("word");
	String pno = request.getParameter("pno");
	String isTrue = request.getParameter("ch");
	
	if (searchWord.trim().equals("")) {
		response.sendRedirect("adminfreelist.jsp?pno="+pno+"");
	} else {
		ArrayList<FreeVO> freeList = new FreeDAO().getFreeByWord(seletedOption, searchWord);
		
		if (freeList != null) {
			request.setAttribute("searchResultArr", freeList);
			request.setAttribute("result", "Y");
			request.setAttribute("selected-option", seletedOption);
			request.setAttribute("word", searchWord);
			
			RequestDispatcher dispatcher = null;
			
			if (isTrue == null) {
				dispatcher = getServletContext().getRequestDispatcher("/admin/adminfreelist.jsp?pno=1");
			} else {
				dispatcher = getServletContext().getRequestDispatcher("/admin/adminfreelist.jsp?pno="+pno+"");
			}
			
			dispatcher.forward(request, response);
		}
	}
%>