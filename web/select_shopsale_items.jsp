<%-- 
    Document   : select_shopsale_items
    Created on : May 1, 2020, 5:05:21 PM
    Author     : azada
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="Beans.Item"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Beans.ShopBranch"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:remove var="currentShopSale" scope="session" />
        <c:remove var="itemsToSelect" scope="session" />

        <jsp:useBean id="currentShopSale" class="Beans.ShopSale" scope="session">
            <jsp:setProperty name="currentShopSale" property="*" />
        </jsp:useBean>
        ${currentShopSale.setSaleDate(param.saleDate)}
        <%currentShopSale.setShopBranch(new ShopBranch(Integer.parseInt(request.getParameter("shopId"))));%>
    
        <jsp:useBean id="itemsToSelect" class="Beans.ItemMgr" scope="session" />
        ${itemsToSelect.retrieveItemsByShopSold(currentShopSale.shopBranch.shopId)}
        
        <h1>Select Item Quantities Sold</h1>
        <form action="insert_shopsale_action.jsp">

            <table border="1" id="item_table">
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
                            Quantity Purchased
                        </th>
                        <th>
                            Current Stock
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${itemsToSelect.itemList}" var="item" varStatus="vstat">
                        <tr>
                            <td>${item.itemName}</td>
                            <td>${item.itemPrice}</td>
                            <td>${item.itemBrand.brandName}</td>
                            <td>
                                <input id="quantity${vstat.index}" min="0" type="number" name="itemIndex:${vstat.index}" value="0" />
                            </td>
                            <fmt:parseNumber var="shopIdInt" integerOnly="true" type="number" value="${param.shopId}"/> 
                            <td id="stock${vstat.index}">
                                ${item.getStockAtShop(shopIdInt)}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <input type="submit" value="Select Items" onclick="return checkStockBalance()"/>
        </form>
        <script>
            function checkStockBalance(){
                var itemTable = document.getElementById("item_table");
                var numRows = itemTable.rows.length;
                for (i = 0; i < numRows; ++i){
                    var currQuantity = parseInt(document.getElementById("quantity"+i).value);
                    var currStock = parseInt(document.getElementById("stock"+i).innerHTML);
                    if (currQuantity > currStock){
                        alert('Out of Stock! Quantity = ' + currQuantity + ' Stock = ' + currStock);
                        return false;
                    }
                }
                return true;
            }
        </script>
    </body>

</html>
