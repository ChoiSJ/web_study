<%@page import="dao.ReviewDAO"%>
<%@page import="vo.ReviewReVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");
	/* 리다이렉션 할때 해당 게시판번호와 페이지번호 이용해서 게시글 이동 */
	int reviewNo = Integer.parseInt(request.getParameter("reviewno"));
	int pageNo = Integer.parseInt(request.getParameter("pageno"));
	
	String content = request.getParameter("recontent");
	String userId = request.getParameter("userid");
	String userName = request.getParameter("username");
	
	ReviewReVO revo = new ReviewReVO();
	ReviewDAO rdao = new ReviewDAO();
	
	revo.setReviewNo(reviewNo);
	revo.setUserId(userId);
	revo.setUserName(userName);
	revo.setContent(content);
	rdao.addReply(revo);
	response.sendRedirect("reviewDetail.jsp?no="+reviewNo+"&pno="+pageNo);
%>