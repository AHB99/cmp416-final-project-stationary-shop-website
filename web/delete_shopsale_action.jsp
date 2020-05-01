<%-- 
    Document   : delete_shopsale_action
    Created on : May 1, 2020, 6:20:06 PM
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
        <jsp:useBean id="shopSale" class="Beans.ShopSale">
            <jsp:setProperty name="shopSale" property="*" />
        </jsp:useBean>
        <c:choose>
            <c:when test="${shopSale.deleteShopSale()}" >
                <c:set var="success_msg" value="Successfully deleted shop sale!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error deleting shop sale!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
