<%@page import="vo.ProgramApplyVO"%>
<%@page import="vo.ProgramVO"%>
<%@page import="dao.ProgramDAO"%>
<%@page import="dao.ProgramApplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");

	int pno = Integer.parseInt(request.getParameter("pno"));
	int cno = Integer.parseInt(request.getParameter("cno"));
	int ano = Integer.parseInt(request.getParameter("ano"));
	
	ProgramApplyDAO dao = new ProgramApplyDAO();
	ProgramDAO pdao = new ProgramDAO();
	ProgramVO vo = new ProgramVO();

	int crowdNo = pdao.getCrowdNumber(pno);
	int ticket = dao.countTicket(ano);
	String result = dao.getResult(ano);
		
	if ("신청중".equals(result) && crowdNo >= ticket) {
		if (cno == 1) { // 당첨
			dao.successPro(ano);
			crowdNo = crowdNo - ticket;
		
			vo.setCrowdnumber(crowdNo);
			vo.setProgramNo(pno);
		
			pdao.crowdNoUpdate(vo);
		
			response.sendRedirect("/admin/confirmationuserlist.jsp?pno="+pno);
		} else if(cno == 2 ){ // 다음기회에
			dao.failPro(ano);
		
			response.sendRedirect("/admin/confirmationuserlist.jsp?pno="+pno);
		}
	} else {
		response.sendRedirect("/admin/confirmationuserlist.jsp?pno="+pno);		
	}
%>