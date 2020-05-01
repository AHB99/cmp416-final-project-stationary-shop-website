<%-- 
    Document   : update_stockpurchases_item
    Created on : May 1, 2020, 3:02:27 PM
    Author     : azada
--%>

<%@page import="Beans.Item"%>
<%@page import="Beans.Supplier"%>
<%@page import="Beans.SuppliedItem"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="selectedStockPurchaseItem" class="Beans.StockPurchaseItem">
            <jsp:setProperty name="selectedStockPurchaseItem" property="*"/>
        </jsp:useBean>
        <% selectedStockPurchaseItem.setSuppliedItem(new SuppliedItem(new Supplier(Integer.parseInt(request.getParameter("supplierId"))),new Item(Integer.parseInt(request.getParameter("itemId"))),0)); %>
        ${selectedStockPurchaseItem.retrieveStockPurchaseItem()}
        <h1>Update Stock Purchase Item</h1>
        <form action="update_stockpurchases_item_action.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="supplier_name">Supplier: </label>
                <input type="text" id="supplier_name" name="" value="${selectedStockPurchaseItem.suppliedItem.supplier.supplierName}" disabled />
                <br/>
                <label for="item_name">Item: </label>
                <input type="text" id="item_name" name="" value="${selectedStockPurchaseItem.suppliedItem.item.itemName}" disabled />
                <br/>
                <label for="purchase_date">Quantity: </label>
                <input type="number" id="quantity" name="quantity" value="${selectedStockPurchaseItem.quantity}" />
                
                <input type="hidden" name="purchaseId" value="${selectedStockPurchaseItem.purchaseId}"/>
                <input type="hidden" name="supplierId" value="${selectedStockPurchaseItem.suppliedItem.supplier.supplierId}"/>
                <input type="hidden" name="itemId" value="${selectedStockPurchaseItem.suppliedItem.item.itemId}"/>

                <input type="submit" value="Update" />
            </fieldset>
        </form>
    </body>
</html>
