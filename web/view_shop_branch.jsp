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
        <%@ include file="login_checker_gist" %>

        <h1>All Shop Branches</h1>
        <jsp:useBean id="shopBranchMgr" class="Beans.ShopBranchMgr"/>
        <fieldset>
            <legend>Filter By:</legend>
            <form action="view_shop_branch.jsp">
                <label for="name_partial">Location Name (Partial Phrase): </label>
                <input type="text" id="name_partial" required name="namePartialPhrase" value=""/>
                <input type="hidden" name="filter_by" value="name_partial_phrase_fil"/>
                <input type="submit" value="Filter by Location Name" /><br/>
            </form>
            <form action="view_shop_branch.jsp">
                <input type="hidden" name="filter_by" value=""/>
                <input type="submit" value="Clear Filters" /><br/>
            </form>
        </fieldset>
        <br/>
        <c:choose>
            <c:when test="${param.filter_by.equals('name_partial_phrase_fil')}">
                ${shopBranchMgr.retrieveShopBranchesByPartialPhrase(param.namePartialPhrase)}
            </c:when>
            <c:otherwise>
                ${shopBranchMgr.retrieveShopBranches()}
            </c:otherwise>
        </c:choose>


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
                    <th>
                        Update
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
                <form action="update_shop_branch.jsp">
                    <input type="hidden" name="shopId" value="${shop.shopId}"/>
                    <td><input type="submit" value="Update" /></td>
                </form>
            </tr>
        </c:forEach>
    </tbody>
</table>
<form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 
</body>
</html>
