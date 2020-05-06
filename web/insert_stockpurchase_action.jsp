<%-- 
    Document   : insert_stockpurchase_action
    Created on : Apr 30, 2020, 9:26:33 PM
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
        <%@ include file="login_checker_gist" %>

        <jsp:useBean id="currentStockPurchase" class="Beans.StockPurchase" scope="session"/>
        <%
            System.out.println("Adding this stock purchase: " + currentStockPurchase);
        %>

        <c:choose >
            <c:when test="${currentStockPurchase.insertStockPurchase()}">
                <c:set var="success_msg" value="Successfully inserted stock purchase!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error inserting stock purchase!" scope="request" />
            </c:otherwise>
        </c:choose>
        <c:remove var="currentStockPurchase" scope="session" />
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
