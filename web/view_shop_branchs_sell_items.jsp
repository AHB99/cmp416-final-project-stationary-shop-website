<%-- 
    Document   : view_shop_branchs_sell_items
    Created on : Apr 28, 2020, 11:16:34 PM
    Author     : azada
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        <jsp:useBean id="itemMgr" class="Beans.ItemMgr"/>
        <%itemMgr.retrieveItemsByShopSold(Integer.parseInt(request.getParameter("shopId")));%>

        <h1>${param.location} Branch's Supplied Items</h1>

        <table border="1">
            <thead>
                <tr>
                    <th>
                        Name
                    </th>
                    <th>
                        Price
                    </th>
                    <th>
                        Brand
                    </th>
                    <th>
                        Current Stock
                    </th>
                    <th>
                        Delete
                    </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${itemMgr.itemList}" var="item">
                    <tr>
                        <td>${item.itemName}</td>
                        <td>${item.itemPrice}</td>
                        <td>${item.itemBrand.brandName}</td>
                        <fmt:parseNumber var="shopIdInt" integerOnly="true" type="number" value="${param.shopId}"/> 
                        <td>
                            ${item.getStockAtShop(shopIdInt)}
                        </td>
                        <form action="delete_seller_item_action.jsp">
                            <input type="hidden" name="shopId" value="${param.shopId}"/>
                            <input type="hidden" name="itemId" value="${item.itemId}"/>
                            <td><input type="submit" value="Delete" /></td>
                        </form>
                    </tr>
                    
                </c:forEach>
            </tbody>
        </table>
        <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 
    </body>
</html>
