<%-- 
    Document   : insert_single_shopsale_item_action
    Created on : May 5, 2020, 7:39:32 PM
    Author     : azada
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="Beans.Item"%>
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
        <jsp:useBean id="shopSaleItem" class="Beans.ShopSaleItem">
            <jsp:setProperty name="shopSaleItem" property="*" />
        </jsp:useBean>

        <%shopSaleItem.setItem(new Item(Integer.parseInt(request.getParameter("itemId"))));%>
        <fmt:parseNumber var="shopIdInt" integerOnly="true" type="number" value="${param.shopId}"/> 

        <c:choose>
            <c:when test="${shopSaleItem.item.getStockAtShop(shopIdInt) < shopSaleItem.quantity}" >
                <c:set var="error_msg" value="Error! Out of stock" scope="request" />
                <jsp:forward page="action_outcome.jsp" /> 
            </c:when>
            <c:when test="${shopSaleItem.insertShopSaleItem()}" >
                <c:set var="success_msg" value="Successfully added shop sale item!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error adding stock shop sale item!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" /> 
    </body>
</html>
