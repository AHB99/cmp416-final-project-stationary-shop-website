<%-- 
    Document   : delete_stockpurchase_action
    Created on : May 1, 2020, 1:04:47 AM
    Author     : azada
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <jsp:useBean id="stockPurchase" class="Beans.StockPurchase">
            <jsp:setProperty name="stockPurchase" property="*" />
        </jsp:useBean>
    <c:choose>
        <c:when test="${stockPurchase.deleteStockPurchase()}" >
            <c:set var="success_msg" value="Successfully deleted stock purchase!" scope="request" />
        </c:when>
        <c:otherwise>
            <c:set var="error_msg" value="Error deleting stpck purchase!" scope="request" />
        </c:otherwise>
    </c:choose>
    <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
