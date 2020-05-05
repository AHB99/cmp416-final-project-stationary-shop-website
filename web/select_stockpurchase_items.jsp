<%-- 
    Document   : select_stockpurchase_items
    Created on : Apr 30, 2020, 8:39:56 PM
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
        <c:remove scope="session" var="suppliedItemsForStockPurchase" />
        <jsp:useBean id="suppliedItemsForStockPurchase" class="Beans.SuppliedItemMgr" scope="session" />
        <jsp:useBean id="currentStockPurchase" class="Beans.StockPurchase" scope="session"/>
        <%suppliedItemsForStockPurchase.retrieveSuppliedItemsBySupplierAndShop(Integer.parseInt(request.getParameter("supplierId")), currentStockPurchase.getShopBranch().getShopId());%>


        <h1>Select Item Quantities Purchased</h1>
        <form action="select_stockpurchase_items_action.jsp">

            <table border="1">
                <thead>
                    <tr>
                        <th>
                            Name
                        </th>
                        <th>
                            Selling Price
                        </th>
                        <th>
                            Brand
                        </th>
                        <th>
                            Supplier Price
                        </th>
                        <th>
                            Quantity Purchased
                        </th>
                        <th>
                            Current Stock
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${suppliedItemsForStockPurchase.suppliedItemList}" var="suppliedItem" varStatus="vstat">
                        <tr>
                            <td>${suppliedItem.item.itemName}</td>
                            <td>${suppliedItem.item.itemPrice}</td>
                            <td>${suppliedItem.item.itemBrand.brandName}</td>
                            <td>${suppliedItem.supplierPrice}</td>
                            <td>
                                <input type="number" min="0" name="itemIndex:${vstat.index}" value="0" />
                            </td>
                            <td>
                                ${suppliedItem.item.getStockAtShop(currentStockPurchase.shopBranch.shopId)}
                            </td>
                        </tr>
                </c:forEach>
                </tbody>
            </table>
            <input type="submit" value="Select Items" />
        </form>

    </body>
</html>
