<%@page import="vo.UserVO"%>
<%@page import="dao.UserDAO"%>
<%@page import="util.MD5"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<% 
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
	
	// DB 에서 아이디에 해당하는 사용자정보 조회
	UserDAO userDao = new UserDAO();
	UserVO user = userDao.getUserById(userid);
	
	// 입력한 아이디에 해당하는 사용자정보가 없는 경우
	if (user == null) {
		response.sendRedirect("main.jsp?err=fail");
		return;
	}
	
	/// 사용자가 입력한 아이디를 db 에 저장된 암호화된 비밀번호와 비교하기 위해서 암호화한다.
	//String securityPassword = MD5.hash(userpwd);
	
	if (!userpwd.equals(user.getPwd())) {
		response.sendRedirect("main.jsp?err=fail");
		return;
	}
	
	// 사용자정보도 존재하고, 비밀번호도 서로 일치하는 경우에만 이 부분은 실행된다.
	HttpSession session = request.getSession(true);
	session.setAttribute("LOGIN_USER", user);
	
	response.sendRedirect("list.jsp?pno=1");
%>