<%-- 
    Document   : delete_shopsale_item_action
    Created on : May 1, 2020, 6:31:12 PM
    Author     : azada
--%>

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
        <jsp:useBean id="shopSaleItemToDelete" class="Beans.ShopSaleItem">
            <jsp:setProperty name="shopSaleItemToDelete" property="*"/>
        </jsp:useBean>
        <%shopSaleItemToDelete.setItem(new Item(Integer.parseInt(request.getParameter("itemId"))));%>
        <c:choose>
            <c:when test="${shopSaleItemToDelete.deleteShopSaleItem()}" >
                <c:set var="success_msg" value="Successfully deleted shop sale item!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error deleting shop sale item!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
