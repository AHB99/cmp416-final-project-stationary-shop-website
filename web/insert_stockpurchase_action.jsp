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
        <jsp:useBean id="currentStockPurchase" class="Beans.StockPurchase" scope="session"/>
        <%
            System.out.println("Adding this stock purchase: " + currentStockPurchase);
        %>
    </body>
</html>
