<%-- 
    Document   : view_shop_branch
    Created on : Apr 26, 2020, 12:48:02 AM
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
        <h1>All Shop Branches</h1>
        <jsp:useBean id="shopBranchMgr" class="Beans.ShopBranchMgr"/>
        ${shopBranchMgr.retrieveShopBranches()}
        <table border="1">
            <thead>
                <tr>
                    <th>
                        Location
                    </th>
                    <th>
                        Square Footage
                    </th>
                    <th>
                        Items Sold
                    </th>
                    <th>
                        Delete
                    </th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${shopBranchMgr.shopList}" var="shop">
                <tr>
                    <td>${shop.location}</td>
                    <td>${shop.squareFootage}</td>
                    <form action="view_shop_branchs_sell_items.jsp">
                        <input type="hidden" name="shopId" value="${shop.shopId}"/>
                        <input type="hidden" name="location" value="${shop.location}"/>
                        <td><input type="submit" value="View Sold Item Info" /></td>
                    </form>
                    <form action="delete_shop_branch_action.jsp">
                        <input type="hidden" name="shopId" value="${shop.shopId}"/>
                        <td><input type="submit" value="Delete" /></td>
                    </form>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 
</body>
</html>
