<%-- 
    Document   : update_stockpurchase_action
    Created on : May 1, 2020, 1:21:26 PM
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
        <jsp:useBean id="stockPurchaseToUpdate" class="Beans.StockPurchase">
            <jsp:setProperty name="stockPurchaseToUpdate" property="purchaseId" param="purchaseId" />
        </jsp:useBean>
        ${stockPurchaseToUpdate.parsePurchaseDate(param.purchaseDate)}
        <c:choose>
            <c:when test="${stockPurchaseToUpdate.updateStockPurchase()}">
                <c:set var="success_msg" value="Successfully updated stock purchase!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error updating stock purchase!" scope="request" />
            </c:otherwise>
        </c:choose>
        <c:remove var="currentStockPurchase" scope="session" />
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
