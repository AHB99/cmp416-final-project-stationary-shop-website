<%-- 
    Document   : insert_shopsale
    Created on : May 1, 2020, 4:54:08 PM
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

        <jsp:useBean id="shopBranchMgr" class="Beans.ShopBranchMgr" />
        ${shopBranchMgr.retrieveShopBranches()}
        <h1>Insert Shop Sale</h1>
        <form action="select_shopsale_items.jsp" method="post">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="shop_id">Shop Branch of Sale: </label>
                <select id="shop_id" name="shopId">
                    <c:forEach items="${shopBranchMgr.shopList}" var="shop">
                        <option value="${shop.shopId}">${shop.location}</option>
                    </c:forEach>        
                </select><br/>
                <label for="sale_date">Date: </label>
                <input type="date" id="sale_date" required name="saleDate" value="" /><br/>
                <input type="submit" value="Add items" />
            </fieldset>
        </form>
    </body>
</html>
