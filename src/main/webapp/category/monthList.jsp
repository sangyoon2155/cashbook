<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%
	String ID = (String)(session.getAttribute("admin_id"));
	
	if(ID == null){ // 로그아웃 상태 일때
		response.sendRedirect("/cashbook/admin/loginForm.jsp");
		return;
	}
%>
<%
    // 현재 월의 기본값은 오늘의 월(1일)
    Calendar firstDate = Calendar.getInstance();
    firstDate.set(Calendar.DATE, 1);  // 1일로 설정

    // targetMonth 파라미터가 있으면 해당 월로 변경
    if (request.getParameter("targetMonth") != null) {
        firstDate.set(Calendar.MONTH, Integer.parseInt(request.getParameter("targetMonth")));
    }

    // 해당 월의 마지막 날짜 계산
    int lastDate = firstDate.getActualMaximum(Calendar.DATE);

    // 첫날의 요일을 계산 (일요일 = 1, 월요일 = 2, ..., 토요일 = 7)
    int dayOfWeek = firstDate.get(Calendar.DAY_OF_WEEK);
    int startBlank = dayOfWeek - 1;

    // 뒤 공백 계산
    int endBlank = 0;

    // totalCell은 7의 배수로 맞춰야 함
    int totalCell = startBlank + lastDate + endBlank;
    if (totalCell % 7 != 0) {
        endBlank = 7 - (totalCell % 7);
        totalCell = totalCell + endBlank;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 달력</title>
</head>
<body>
    <h1>
        <!-- 이전 달, 다음 달 링크 -->
        <a href="/cashbook/category/monthList.jsp?targetMonth=<%=firstDate.get(Calendar.MONTH) - 1%>">[이전달]</a>
        <%=firstDate.get(Calendar.YEAR)%>년 <%=firstDate.get(Calendar.MONTH) + 1%>월
        <a href="/cashbook/category/monthList.jsp?targetMonth=<%=firstDate.get(Calendar.MONTH) + 1%>">[다음달]</a>
    </h1>

    <!-- 달력 테이블 -->
    <table border="1" width="80%" align="center">
        <tr>
            <th>일</th>
            <th>월</th>
            <th>화</th>
            <th>수</th>
            <th>목</th>
            <th>금</th>
            <th>토</th>
        </tr>
        <tr>
            <% 
                for (int i = 1; i <= totalCell; i++) {
            %>
                    <td>
                        <%
                            int day = i - startBlank;
                            if (day > 0 && day <= lastDate) {  // 해당 월의 날짜인 경우
                        %>
                                <div>
                                	<a href="/cashbook/category/dateList.jsp?y=<%=firstDate.get(Calendar.YEAR)%>&m=<%=firstDate.get(Calendar.MONTH) + 1%>&d=<%=day%>">
                                    	<%= day %>
                                    </a>
                                </div>
                        <%
                            }
                        %>
                    </td>
            <%
                    if (i % 7 == 0) {
            %>
                        </tr><tr>  <!-- 한 주가 끝날 때마다 새로운 행 추가 -->
            <%
                    }
                }
            %>
        </tr>
    </table>
    <br>
    <a href="/cashbook/category/categoryList.jsp">[카테고리]</a>
</body>
</html>
