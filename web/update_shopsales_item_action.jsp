<%-- 
    Document   : update_shopsales_item_action
    Created on : May 1, 2020, 6:50:56 PM
    Author     : azada
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Beans.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="shopSaleItem" class="Beans.ShopSaleItem">
            <jsp:setProperty name="shopSaleItem" property="*"/>
        </jsp:useBean>
        <%shopSaleItem.setItem(new Item(Integer.parseInt(request.getParameter("itemId"))));%>
        <c:choose>
            <c:when test="${shopSaleItem.updateShopSaleItem()}">
                <c:set var="success_msg" value="Successfully updated shop sale item!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error updating shop sale item!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
