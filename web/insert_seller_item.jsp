<%-- 
    Document   : insert_seller_item
    Created on : Apr 28, 2020, 10:59:53 PM
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
        <jsp:useBean id="shopBranchMgr" class="Beans.ShopBranchMgr" />
        ${shopBranchMgr.retrieveShopBranches()}
        <jsp:useBean id="itemMgr" class="Beans.ItemMgr" />
        ${itemMgr.retrieveItems()}
        <h1>Match Item(s) for Shop</h1>
        <form action="insert_seller_item_action.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="shop_id">Shop Branch: </label>
                <select id="shop_id" name="shopId">
                    <c:forEach items="${shopBranchMgr.shopList}" var="shop">
                        <option value="${shop.shopId}">${shop.location}</option>
                    </c:forEach>        
                </select><br/>
                <label for="item_id">Item: </label>
                <select id="item_id" name="itemIds" multiple="multiple">
                    <c:forEach items="${itemMgr.itemList}" var="item">
                        <option value="${item.itemId}">${item.itemName}</option>
                    </c:forEach>        
                </select><br/>
                <input type="submit" value="Insert" />
            </fieldset>
        </form>
    </body>
</html>
