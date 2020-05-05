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

        <h1>Select Shop</h1>
        <form action="select_seller_item_info.jsp">
            <fieldset>
                <label for="shop_id">Shop Branch: </label>
                <select id="shop_id" name="shopId">
                    <c:forEach items="${shopBranchMgr.shopList}" var="shop">
                        <option value="${shop.shopId}">${shop.location}</option>
                    </c:forEach>        
                </select><br/>
                
                <input type="submit" value="Select" />
            </fieldset>
        </form>
    </body>
</html>
