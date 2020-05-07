<%-- 
    Document   : view_item
    Created on : Apr 28, 2020, 7:50:16 PM
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

        <h1>All Items</h1>
        <jsp:useBean id="itemMgr" class="Beans.ItemMgr"/>


        <fieldset>
            <legend>Filter By:</legend>
            <form action="view_item.jsp" method="post">
                <label for="name_partial">Name (Partial Phrase): </label>
                <input type="text" id="name_partial" required name="namePartialPhrase" value="${param.namePartialPhrase}"/>
                <input type="hidden" name="filter_by" value="name_partial_phrase_fil"/>
                <input type="submit" value="Filter by Name" /><br/>
            </form>
            <form action="view_item.jsp" method="post">
                    <label for="price_range_lower">Price Range: </label>
                    <input type="number" id="price_range_lower" required step="0.01" min="0" name="priceLower" value="${param.priceLower}"/> - 
                    <input type="number" id="price_range_upper" required step="0.01" min="0" name="priceUpper" value="${param.priceUpper}"/>
                    <input type="hidden" name="filter_by" value="price_range_fil"/>
                    <input type="submit" value="Filter by Price Range" /><br/>
            </form>
            <form action="view_item.jsp" method="post">
                <input type="hidden" name="filter_by" value=""/>
                <input type="submit" value="Clear Filters" /><br/>
            </form>
        </fieldset>
        <br/>
        <c:choose>
            <c:when test="${param.filter_by.equals('name_partial_phrase_fil')}">
                ${itemMgr.retrieveItemsByNamePartialPhrase(param.namePartialPhrase)}
            </c:when>
            <c:when test="${param.filter_by.equals('price_range_fil')}">
                <%itemMgr.retrieveItemsByPriceRange(Float.parseFloat(request.getParameter("priceLower")), Float.parseFloat(request.getParameter("priceUpper")));%>
            </c:when>
            <c:otherwise>
                ${itemMgr.retrieveItems()}
            </c:otherwise>
        </c:choose>



        <table border="1">
            <thead>
                <tr>
                    <th>
                        Name
                    </th>
                    <th>
                        Price
                    </th>
                    <th>
                        Brand
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
                <c:forEach items="${itemMgr.itemList}" var="item">
                    <tr>
                        <td>${item.itemName}</td>
                        <td>${item.itemPrice}</td>
                        <td>${item.itemBrand.brandName}</td>
                <form action="delete_item_action.jsp" method="post">
                    <input type="hidden" name="itemId" value="${item.itemId}"/>
                    <td><input type="submit" value="Delete" /></td>
                </form>
                <form action="update_item.jsp" method="post">
                    <input type="hidden" name="itemId" value="${item.itemId}"/>
                    <td><input type="submit" value="Update" /></td>
                </form>
            </tr>
        </c:forEach>
    </tbody>
</table>
<form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 
</body>
</html>
