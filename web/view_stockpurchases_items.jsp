<%-- 
    Document   : view_stockpurchases_items
    Created on : May 1, 2020, 12:22:12 AM
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
        <jsp:useBean id="selectedStockPurchase" class="Beans.StockPurchase">
            <jsp:setProperty name="selectedStockPurchase" property="*" />
        </jsp:useBean>
        ${selectedStockPurchase.retrieveStockPurchase()}
        <h1>Selected Stock Purchase Items</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Supplier</th>
                    <th>Item Name</th>
                    <th>Selling Price</th>
                    <th>Brand</th>
                    <th>Supplier Price</th>
                    <th>Quantity</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${selectedStockPurchase.stockPurchaseItemMgr.stPurItemList}" var="stockPurchaseItem">
                <tr>
                    <td>${stockPurchaseItem.suppliedItem.supplier.supplierName}</td>
                    <td>${stockPurchaseItem.suppliedItem.item.itemName}</td>
                    <td>${stockPurchaseItem.suppliedItem.item.itemPrice}</td>
                    <td>${stockPurchaseItem.suppliedItem.item.itemBrand.brandName}</td>
                    <td>${stockPurchaseItem.suppliedItem.supplierPrice}</td>
                    <td>${stockPurchaseItem.quantity}</td>
                    <form action="delete_stockpurchases_item_action.jsp">
                        <input type="hidden" name="purchaseId" value="${selectedStockPurchase.purchaseId}"/>
                        <input type="hidden" name="supplierId" value="${stockPurchaseItem.suppliedItem.supplier.supplierId}"/>
                        <input type="hidden" name="itemId" value="${stockPurchaseItem.suppliedItem.item.itemId}"/>
                        <td><input type="submit" value="Delete" /></td>
                    </form>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 

</body>
</html>
