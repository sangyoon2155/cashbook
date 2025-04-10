<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<%@ page import= "java.util.*" %>
<%@ page import= "model.*" %>
<%@ page import= "dto.*" %>
<% 
	
	String ID = (String)(session.getAttribute("admin_id"));
	
	if(ID == null){ // 로그아웃 상태 일때
		response.sendRedirect("/cashbook/admin/loginForm.jsp");
		return;
	}
	
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category>list = new ArrayList<>();
	try {
		list = categoryDao.CategoryList(); // 실제 데이터 가져오기
	} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
		out.println("데이터를 가져오는 데 실패했습니다.");
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
			for(Category category : list) {
				Cash cash = category.getCash();
		%>
				
				<tr>
					<td><%=cash.getCash_date()%></td>
					<td><%=category.getKind()%></td>
					<td><%=category.getTitle()%></td>
					<td><%=cash.getMemo()%></td>
					<td><%=cash.getAmount()%></td>
					<td></td>
					<td><a href="/cashbook/category/deleteCategory.jsp">삭제</a></td>
				</tr>
				
		<% 
			}
		%>

	</table>
	<a href="/cashbook/category/insertCategoryForm.jsp">[생성]</a>
	<a href="/cashbook/category/updateCategoryTitleForm.jsp">[제목변경]</a>
	<a href="/cashbook/category/deleteCategory.jsp">[삭제]</a>
	<a href="/cashbook/category/monthList.jsp">[달력]</a>
	<a href="/cashbook/admin/logout.jsp">[로그아웃]</a>	
</body>
</html>