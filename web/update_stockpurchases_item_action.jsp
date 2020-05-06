<%-- 
    Document   : update_stockpurchases_item_action
    Created on : May 1, 2020, 3:20:27 PM
    Author     : azada
--%>

<%@page import="Beans.SuppliedItem"%>
<%@page import="Beans.Supplier"%>
<%@page import="Beans.Item"%>
<%@page import="Beans.Item"%>
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

        <jsp:useBean id="stockPurchaseItemToUpdate" class="Beans.StockPurchaseItem">
            <jsp:setProperty name="stockPurchaseItemToUpdate" property="*" />
        </jsp:useBean>
        <% stockPurchaseItemToUpdate.setSuppliedItem(new SuppliedItem(new Supplier(Integer.parseInt(request.getParameter("supplierId"))), new Item(Integer.parseInt(request.getParameter("itemId"))), 0));%>

        <c:choose>
            <c:when test="${stockPurchaseItemToUpdate.updateStockPurchaseItem()}">
                <c:set var="success_msg" value="Successfully updated stock purchase item!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error updating stock purchase item!" scope="request" />
            </c:otherwise>
        </c:choose>
        <c:remove var="currentStockPurchase" scope="session" />
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
