<%@page import="dao.ItemDAO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<% 
	HttpSession session = request.getSession();
	
	if (session == null) {
		response.sendRedirect("loginform.jsp?err=deny");
		return;
	}
	
	UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
	
	if (user == null) {
		response.sendRedirect("loginform.jsp?err=deny");
		return;
	}
	
	// user 가  null 이 아닌 상황
	// 로그인한 사용자의 아이디를 가져올 수 있다.
	String userId = user.getId();
	int itemNo = Integer.parseInt(request.getParameter("ino"));
	
	ItemDAO dao = new ItemDAO();
	dao.addCart(itemNo, userId);
	
	// 장바구니 리스트 목록 페이지를 다시 요청하게 하기
	response.sendRedirect("cart.jsp");
%>