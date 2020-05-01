<%-- 
    Document   : select_shopsale_items
    Created on : May 1, 2020, 5:05:21 PM
    Author     : azada
--%>

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
        
        <h1>Select Item Quantities Purchased</h1>
        <form action="insert_shopsale_action.jsp">

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
                            Quantity Purchased
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
                                <input type="number" name="itemIndex:${vstat.index}" value="0" />
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <input type="submit" value="Select Items" />
        </form>
    </body>
</html>
