<%-- 
    Document   : view_shopsale
    Created on : May 1, 2020, 6:00:45 PM
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
        <jsp:useBean id="shopSaleMgr" class="Beans.ShopSaleMgr" />
        ${shopSaleMgr.retrieveShopSales()}

        <h1>All Shop Sales</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>
                        Branch Location
                    </th>
                    <th>
                        Sale Date
                    </th>
                    <th>
                        View Sold Items
                    </th>
                    <th>
                        Delete
                    </th>
                    <th>
                        Update
                    </th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${shopSaleMgr.shopSaleList}" var="shopSale">
                <tr>
                    <td>${shopSale.shopBranch.location}</td>
                    <td>${shopSale.saleDate}</td>
                <form action="view_shopsale_items.jsp">
                    <input type="hidden" name="saleId" value="${shopSale.saleId}"/>
                    <td><input type="submit" value="View Sold Items" /></td>
                </form>
                <form action="delete_shopsale_action.jsp">
                    <input type="hidden" name="saleId" value="${shopSale.saleId}"/>
                    <td><input type="submit" value="Delete" /></td>
                </form>
                <form action="update_shopsale.jsp">
                    <input type="hidden" name="location" value="${shopSale.shopBranch.location}"/>
                    <input type="hidden" name="saleDate" value="${shopSale.saleDate}"/>
                    <input type="hidden" name="saleId" value="${shopSale.saleId}"/>
                    <td><input type="submit" value="Update" /></td>
                </form>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 
</body>
</html>
