<%-- 
    Document   : delete_seller_item_action
    Created on : Apr 29, 2020, 5:47:23 PM
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
        <jsp:useBean id="sellerItemToDelete" class="Beans.SellerItem"/>

        <jsp:useBean id="sellerItemShopToDelete" class="Beans.ShopBranch">
            <jsp:setProperty name="sellerItemShopToDelete" property="shopId" param="shopId" />
        </jsp:useBean>
        <c:set target="${sellerItemToDelete}" property="shopBranch" value="${sellerItemShopToDelete}" /> 

        <jsp:useBean id="sellerItemItemToDelete" class="Beans.Item">
            <jsp:setProperty name="sellerItemItemToDelete" property="itemId" param="itemId" />
        </jsp:useBean>
        <c:set target="${sellerItemToDelete}" property="item" value="${sellerItemItemToDelete}" /> 

        <c:choose>
            <c:when test="${sellerItemToDelete.deleteSellerItem()}" >
                <c:set var="success_msg" value="Successfully disassociated item with shop!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error disassociating item with shop!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
