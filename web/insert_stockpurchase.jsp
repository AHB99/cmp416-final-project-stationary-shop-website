<%-- 
    Document   : insert_stockpurchase
    Created on : Apr 30, 2020, 8:27:21 PM
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
        <h1>Insert Stock Purchase</h1>
        <form action="initialize_stockpurchase_for_insert.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="shop_id">Shop Branch of Stock Purchase: </label>
                <select id="shop_id" name="shopId">
                    <c:forEach items="${shopBranchMgr.shopList}" var="shop">
                        <option value="${shop.shopId}">${shop.location}</option>
                    </c:forEach>        
                </select><br/>
                <label for="purchase_date">Date: </label>
                <input type="date" id="purchase_date" name="purchaseDate" value="" />
                <input type="submit" value="Add items" />
            </fieldset>
        </form>
    </body>
</html>
