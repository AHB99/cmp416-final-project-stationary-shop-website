<%-- 
    Document   : update_shopsale_action
    Created on : May 1, 2020, 6:25:15 PM
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
        <%@ include file="login_checker_gist" %>

        <jsp:useBean id="shopSaleToUpdate" class="Beans.ShopSale">
            <jsp:setProperty name="shopSaleToUpdate" property="saleId" param="saleId" />
        </jsp:useBean>
        ${shopSaleToUpdate.setSaleDate(param.saleDate)}s
        <c:choose>
            <c:when test="${shopSaleToUpdate.updateShopSale()}">
                <c:set var="success_msg" value="Successfully updated shop sale!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error updating shop sale!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
