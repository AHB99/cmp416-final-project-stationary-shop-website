<%-- 
    Document   : insert_single_stockpurchase_item_action
    Created on : May 5, 2020, 6:47:48 PM
    Author     : azada
--%>

<%@page import="Beans.Item"%>
<%@page import="Beans.Supplier"%>
<%@page import="Beans.SuppliedItem"%>
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

        <jsp:useBean id="stockPurchaseItem" class="Beans.StockPurchaseItem">
            <jsp:setProperty name="stockPurchaseItem" property="*" />
        </jsp:useBean>
        
        <%stockPurchaseItem.setSuppliedItem(new SuppliedItem(new Supplier(Integer.parseInt(request.getParameter("supplierId"))),new Item(Integer.parseInt(request.getParameter("supplierId"))),0));%>

        <c:choose>
            <c:when test="${stockPurchaseItem.insertStockPurchaseItem()}" >
                <c:set var="success_msg" value="Successfully added stock purchase item!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error adding stock purchase item!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />   
    </body>
</html>
