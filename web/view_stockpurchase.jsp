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
        <%@ include file="login_checker_gist" %>

        <jsp:useBean id="stockPurchaseMgr" class="Beans.StockPurchaseMgr"/>
        <jsp:useBean id="shopBranchMgr" class="Beans.ShopBranchMgr" />
        ${shopBranchMgr.retrieveShopBranches()}
        <h1>All Stock Purchases</h1>


        <fieldset>
            <legend>Filter By:</legend>
            <form action="view_stockpurchase.jsp" method="post">
                <label for="shop">Shop Branch: </label>
                <select id="shop" name="shopId">
                    <c:forEach items="${shopBranchMgr.shopList}" var="shop">
                        <option value="${shop.shopId}">${shop.location}</option>
                    </c:forEach>        
                </select>
                <input type="hidden" name="filter_by" value="shop_branch_fil"/>
                <input type="submit" value="Filter by Shop Branch" /><br/>
            </form>
            <form action="view_stockpurchase.jsp" method="post">
                <input type="hidden" name="filter_by" value=""/>
                <input type="submit" value="Clear Filters" /><br/>
            </form>
        </fieldset>
        <br/>
        <c:choose>
            <c:when test="${param.filter_by.equals('shop_branch_fil')}">
                <%stockPurchaseMgr.retrieveStockPurchasesByBranch(Integer.parseInt(request.getParameter("shopId")));%>
            </c:when>
            <c:otherwise>
                ${stockPurchaseMgr.retrieveStockPurchases()}
            </c:otherwise>
        </c:choose>





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
                        Purchased Items
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
                <c:forEach items="${stockPurchaseMgr.stockPurchaseList}" var="stockPurchase">
                    <tr>
                        <td>${stockPurchase.shopBranch.location}</td>
                        <td>${stockPurchase.purchaseDate}</td>
                <form action="view_stockpurchases_items.jsp" method="post">
                    <input type="hidden" name="purchaseId" value="${stockPurchase.purchaseId}"/>
                    <td><input type="submit" value="View Purchased Items" /></td>
                </form>
                <form action="delete_stockpurchase_action.jsp" method="post">
                    <input type="hidden" name="purchaseId" value="${stockPurchase.purchaseId}"/>
                    <td><input type="submit" value="Delete" /></td>
                </form>
                <form action="update_stockpurchase.jsp" method="post">
                    <input type="hidden" name="location" value="${stockPurchase.shopBranch.location}"/>
                    <input type="hidden" name="purchaseDate" value="${stockPurchase.purchaseDate}"/>
                    <input type="hidden" name="purchaseId" value="${stockPurchase.purchaseId}"/>
                    <td><input type="submit" value="Update" /></td>
                </form>
            </tr>
        </c:forEach>
    </tbody>
</table>
<form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 
</body>
</html>
