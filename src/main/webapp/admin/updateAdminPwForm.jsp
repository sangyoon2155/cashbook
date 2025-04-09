<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h2>비밀번호 변경</h2>
    <form action="/cashbook/admin/updateAdminPwAction.jsp" method="post">
        <label>아이디: </label>
        <input type="text" name="admin_id" required/><br/>
        <label>기존비밀번호: </label>
        <input type="password" name="admin_pw" required/><br/>
        <label>새비밀번호: </label>
        <input type="password" name="new_password" required/><br/>
        <button type="submit">변경</button>
    </form>
</body>
</html>