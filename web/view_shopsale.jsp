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
        <jsp:useBean id="shopBranchMgr" class="Beans.ShopBranchMgr" />
        ${shopBranchMgr.retrieveShopBranches()}
        <h1>All Shop Sales</h1>

        
        <fieldset>
            <legend>Filter By:</legend>
            <form action="view_shopsale.jsp">
                <label for="shop">Shop Branch: </label>
                <select id="shop" name="shopId">
                    <c:forEach items="${shopBranchMgr.shopList}" var="shop">
                        <option value="${shop.shopId}">${shop.location}</option>
                    </c:forEach>        
                </select>
                <input type="hidden" name="filter_by" value="shop_branch_fil"/>
                <input type="submit" value="Filter by Shop Branch" /><br/>
            </form>
            <form action="view_shopsale.jsp">
                <input type="hidden" name="filter_by" value=""/>
                <input type="submit" value="Clear Filters" /><br/>
            </form>
        </fieldset>
        <br/>
        <c:choose>
            <c:when test="${param.filter_by.equals('shop_branch_fil')}">
                <%shopSaleMgr.retrieveShopSalesByBranch(Integer.parseInt(request.getParameter("shopId")));%>
            </c:when>
            <c:otherwise>
                ${shopSaleMgr.retrieveShopSales()}
            </c:otherwise>
        </c:choose>

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
                        Sold Items
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
                    <input type="hidden" name="shopId" value="${shopSale.shopBranch.shopId}"/>

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
