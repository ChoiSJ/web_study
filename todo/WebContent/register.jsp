<%@page import="vo.UserVO"%>
<%@page import="vo.TodoVO"%>
<%@page import="dao.TodoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<% 
	request.setCharacterEncoding("utf-8");

	HttpSession session = request.getSession(false);
	
	if (session == null) {
		response.sendRedirect("main.jsp?err=deny");
		return;
	}
	
	UserVO user = (UserVO) session.getAttribute("LOGIN_USER");
	
	if (user == null) {
		response.sendRedirect("main.jsp?err=deny");
		return;
	}
	
	// 세션객체도 찾았고, 세션객체에서 로그인된 사용자 정보로 찾았을 때 실행되는 부분
	String category = request.getParameter("category");
	String title = request.getParameter("title");
	String description = request.getParameter("description");
	String location = request.getParameter("location");
	String day = request.getParameter("day");
	
	TodoDAO dao = new TodoDAO();
	TodoVO todo = new TodoVO();
	
	todo.setCategory(category);
	todo.setTitle(title);
	todo.setDescription(description);
	todo.setLocation(location);
	todo.setDay(day);
	
	dao.addTodo(todo);
	
	response.sendRedirect("list.jsp?pno=1");
%>
