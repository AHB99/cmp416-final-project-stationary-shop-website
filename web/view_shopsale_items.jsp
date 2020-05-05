<%-- 
    Document   : view_shopsale_items
    Created on : May 1, 2020, 6:08:11 PM
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
        <jsp:useBean id="selectedShopSale" class="Beans.ShopSale">
            <jsp:setProperty name="selectedShopSale" property="*" />
        </jsp:useBean>
        ${selectedShopSale.retrieveShopSale()}

        <h1>Selected Shop Sale Items</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Selling Price</th>
                    <th>Brand</th>
                    <th>Quantity</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${selectedShopSale.shopSaleItems.shopSaleItemList}" var="shopSaleItem">
                    <tr>
                        <td>${shopSaleItem.item.itemName}</td>
                        <td>${shopSaleItem.item.itemPrice}</td>
                        <td>${shopSaleItem.item.itemBrand.brandName}</td>
                        <td>${shopSaleItem.quantity}</td>
                <form action="delete_shopsale_item_action.jsp">
                    <input type="hidden" name="saleId" value="${selectedShopSale.saleId}"/>
                    <input type="hidden" name="itemId" value="${shopSaleItem.item.itemId}"/>
                    <td><input type="submit" value="Delete" /></td>
                </form>
                <form action="update_shopsale_item.jsp">
                    <input type="hidden" name="saleId" value="${selectedShopSale.saleId}"/>
                    <input type="hidden" name="itemId" value="${shopSaleItem.item.itemId}"/>
                    <td><input type="submit" value="Update" /></td>
                </form>
            </tr>
        </c:forEach>
    </tbody>
</table>
<form action="insert_single_shopsale_item.jsp">
    <input type="hidden" name="saleId" value="${param.saleId}"/>
    <input type="hidden" name="shopId" value="${param.shopId}"/>
    <td><input type="submit" value="Add Item" /></td>
</form>
<form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 
</body>
</html>
