<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ID = (String)(session.getAttribute("admin_id"));
	if(ID != null){ // 로그인 상태 일때
		response.sendRedirect("/cashbook/category/categoryList.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%
		if(request.getParameter("error") != null) { // 비밀번호 수정 실패, 로그인 실패시 에러메시지 출력
	%>
			<div><%=request.getParameter("error")%></div>
	<% 		
		} if(request.getParameter("update") != null) { // 비밀번호 수정 성공시 메시지 출력
	%>
			<div><%=request.getParameter("update")%></div>
	<% 		
		}
	%>
	<h2>로그인</h2>
    <form action="/cashbook/admin/loginAction.jsp" method="post">
        <label>아이디: </label>
        <input type="text" name="admin_id" required/><br/>
        <label>비밀번호: </label>
        <input type="password" name="admin_pw" required/><br/>
        <button type="submit">로그인</button>
    </form>
    <br>
    <a href="/cashbook/admin/updateAdminPwForm.jsp">[비밀번호 수정]</a>
</body>
</html>