<%-- 
    Document   : insert_shopsale_action
    Created on : May 1, 2020, 5:21:18 PM
    Author     : azada
--%>

<%@page import="Beans.ShopSaleItem"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="currentShopSale" class="Beans.ShopSale" scope="session"/>
        <jsp:useBean id="itemsToSelect" class="Beans.ItemMgr" scope="session"/>
        
        <%
            for (int i = 0; i < itemsToSelect.getItemList().size(); ++i) {
                int itemQuantity = Integer.parseInt(request.getParameter("itemIndex:" + i));
                if (itemQuantity > 0) {
                    currentShopSale.addShopSaleItem(
                    new ShopSaleItem(null, 
                    itemsToSelect.getItemList().get(i),itemQuantity));
                }
            }
        %>

        <c:choose >
            <c:when test="${currentShopSale.insertShopSale()}">
                <c:set var="success_msg" value="Successfully inserted shop sale!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error inserting shop sale!" scope="request" />
            </c:otherwise>
        </c:choose>
        
        <c:remove var="currentShopSale" scope="session" />
        <c:remove var="itemsToSelect" scope="session" />

        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
