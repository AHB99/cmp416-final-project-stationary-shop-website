<%-- 
    Document   : update_shopsale_item
    Created on : May 1, 2020, 6:42:03 PM
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
        <%@ include file="login_checker_gist" %>

        <jsp:useBean id="selectedShopSaleItem" class="Beans.ShopSaleItem">
            <jsp:setProperty name="selectedShopSaleItem" property="*"/>
        </jsp:useBean>
        <%selectedShopSaleItem.setItem(new Item(Integer.parseInt(request.getParameter("itemId"))));%>
        ${selectedShopSaleItem.retrieveShopSaleItem()}
        <h1>Update Shop Sale Item</h1>
        <form action="update_shopsales_item_action.jsp" method="post">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="item_name">Item: </label>
                <input type="text" id="item_name" name="" value="${selectedShopSaleItem.item.itemName}" disabled />
                <br/>
                <label for="purchase_date">Quantity: </label>
                <input type="number" id="quantity" required name="quantity" min="0" value="${selectedShopSaleItem.quantity}" />

                <input type="hidden" name="saleId" value="${param.saleId}"/>
                <input type="hidden" name="itemId" value="${param.itemId}"/>

                <input type="submit" value="Update" />
            </fieldset>
        </form>
    </body>
</html>
