<%-- 
    Document   : initialize_stockpurchase
    Created on : Apr 30, 2020, 9:49:09 PM
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
        <c:remove scope="session" var="currentStockPurchase" />
        <jsp:useBean id="currentStockPurchase" class="Beans.StockPurchase" scope="session">
            <jsp:useBean id="currentStockPurchaseShop" class="Beans.ShopBranch">
                <jsp:setProperty name="currentStockPurchaseShop" property="shopId" param="shopId" />
            </jsp:useBean>
            <c:set target="${currentStockPurchase}" property="shopBranch" value="${currentStockPurchaseShop}" />
            ${currentStockPurchase.parsePurchaseDate(param.purchaseDate)}
        </jsp:useBean>
        <jsp:forward page="select_stockpurchase_supplier.jsp" />
    </body>
</html>
