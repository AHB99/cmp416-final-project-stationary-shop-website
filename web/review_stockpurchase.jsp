<%-- 
    Document   : review_stockpurchase
    Created on : Apr 30, 2020, 8:55:12 PM
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

        <jsp:useBean id="currentStockPurchase" class="Beans.StockPurchase" scope="session"/>
        <h1>Review Stock Purchase</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Supplier</th>
                    <th>Item Name</th>
                    <th>Selling Price</th>
                    <th>Brand</th>
                    <th>Supplier Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${currentStockPurchase.stockPurchaseItemMgr.stPurItemList}" var="stockPurchaseItem">
                <tr>
                    <td>${stockPurchaseItem.suppliedItem.supplier.supplierName}</td>
                    <td>${stockPurchaseItem.suppliedItem.item.itemName}</td>
                    <td>${stockPurchaseItem.suppliedItem.item.itemPrice}</td>
                    <td>${stockPurchaseItem.suppliedItem.item.itemBrand.brandName}</td>
                    <td>${stockPurchaseItem.suppliedItem.supplierPrice}</td>
                    <td>${stockPurchaseItem.quantity}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <form action="insert_stockpurchase_action.jsp">
        <td><input type="submit" value="Confirm Stock Purchase" /></td>
    </form>
        <form action="select_stockpurchase_supplier.jsp">
        <td><input type="submit" value="Add More Items" /></td>
    </form>
    </body>
</html>
