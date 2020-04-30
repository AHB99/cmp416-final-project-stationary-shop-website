<%-- 
    Document   : view_stockpurchase
    Created on : May 1, 2020, 12:05:44 AM
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
        <jsp:useBean id="stockPurchaseMgr" class="Beans.StockPurchaseMgr"/>
        ${stockPurchaseMgr.retrieveStockPurchases()}
        <h1>All Stock Purchases</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>
                        Branch Location
                    </th>
                    <th>
                        Purchase Date
                    </th>
                    <th>
                        View Purchased Items
                    </th>
                    <th>
                        Delete
                    </th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${stockPurchaseMgr.stockPurchaseList}" var="stockPurchase">
                <tr>
                    <td>${stockPurchase.shopBranch.location}</td>
                    <td>${stockPurchase.purchaseDate}</td>
                    <form action="view_stockpurchases_items.jsp">
                        <input type="hidden" name="purchaseId" value="${stockPurchase.purchaseId}"/>
                        <td><input type="submit" value="View Purchased Items" /></td>
                    </form>
                    <form action="delete_stockpurchase_action.jsp">
                        <input type="hidden" name="purchaseId" value="${stockPurchase.purchaseId}"/>
                        <td><input type="submit" value="Delete" /></td>
                    </form>
                </tr>
        </c:forEach>
        </tbody>
    </table>
    <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 
    </body>
</html>
