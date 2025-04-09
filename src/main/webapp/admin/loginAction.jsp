<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "dto.*" %>
<%@ page import = "model.*" %>
<%
	String admin_id = request.getParameter("admin_id");
	String admin_pw = request.getParameter("admin_pw");
	
	UserDao userDao = new UserDao();
	
	boolean isValid = false;
	isValid = userDao.verifyLogin(admin_id, admin_pw);
	
	if(isValid) { // 로그인 성공시
		session.setAttribute("admin_id", admin_id);
		session.setAttribute("admin_pw", admin_pw);
		
		response.sendRedirect("/cashbook/category/categoryList.jsp"); 	
	} else { // 로그인 실패시
		response.sendRedirect("/cashbook/admin/loginForm.jsp?error=incorrect");
	}
%>