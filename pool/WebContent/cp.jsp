<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	long begin1 = System.currentTimeMillis();	

	Context initContext = new InitialContext();
	DataSource ds = (DataSource) initContext.lookup("java:/comp/env/jdbc/myoracle");
	Connection con = ds.getConnection();
	System.out.println("획득된 커넥션 객체:" + con);
	con.close();
	
	long end1 = System.currentTimeMillis();
	System.out.println("소요시간:" + (end1-begin1));
	
	long begin2 = System.currentTimeMillis();
	
	Connection con2 = ds.getConnection();
	con2.close();
	
	long end2 = System.currentTimeMillis();
	System.out.println("소요시간:" + (end2-begin2));
%>