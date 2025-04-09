<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<% 
	/*PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String sql = ""; // cash + category 조인한 값 
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
    stmt = conn.prepareStatement(sql); */

	String ID = (String)(session.getAttribute("admin_id"));
	
	if(ID == null){ // 로그아웃 상태 일때
		response.sendRedirect("/cashbook/admin/loginForm.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>카테고리리스트</h1>
	<table border="1">
		<tr>
			<th>일자</th>
			<th>구분</th>
			<th>항목</th>
			<th>기타사항</th>
			<th>금액</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>

		<%
			//while(rs.next()) {
		%>
				<!--
				<tr>
					<td></td>
					<td>></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				-->
		<% 
			//}
		%>

	</table>
	<a href="/cashbook/category/insertCategoryForm.jsp">[생성]</a>
	<a href="/cashbook/category/updateCategoryTitleForm.jsp">[제목변경]</a>
	<a href="/cashbook/category/deleteCategory.jsp">[삭제]</a>
	<a href="/cashbook/category/monthList.jsp">[달력]</a>
	<a href="/cashbook/admin/logout.jsp">[로그아웃]</a>	
</body>
</html>