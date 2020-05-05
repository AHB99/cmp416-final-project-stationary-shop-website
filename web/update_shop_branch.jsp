<%-- 
    Document   : update_shop_branch
    Created on : Apr 29, 2020, 7:15:53 PM
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
        <jsp:useBean id="selectedShopBranch" class="Beans.ShopBranch">
            <jsp:setProperty name="selectedShopBranch" property="*"/>
        </jsp:useBean>
        ${selectedShopBranch.retrieveShopBranch()}
        <h1>Update Shop Branch</h1>
        <form action="update_shop_branch_action.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="location">Location: </label>
                <input type="text" id = "location" name="location" value="${selectedShopBranch.location}" /><br/>
                <label for="square_footage">Square Footage </label>
                <input type="number" id = "square_footage" step="0.01" min="0" name="squareFootage" value="${selectedShopBranch.squareFootage}" /><br/>
                <input type="hidden" name="shopId" value="${selectedShopBranch.shopId}" /><br/>
                <input type="submit" value="Update" />
            </fieldset>
        </form>
    </body>
</html>
