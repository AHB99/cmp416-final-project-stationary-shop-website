<%-- 
    Document   : graph_menu_action
    Created on : May 1, 2020, 8:25:24 PM
    Author     : azada
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <c:choose>
        <c:when test="${param.graph_choice == 'employee_salary_hist'}">
            <jsp:forward page="graph_employee_salary_hist.jsp" />
        </c:when>
        <c:when test="${param.graph_choice == 'monthly_profit_line'}">
            <jsp:forward page="graph_monthly_profit_line.jsp" />
        </c:when>
    </c:choose>
</body>
</html>
