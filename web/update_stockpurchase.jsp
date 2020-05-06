<%-- 
    Document   : update_stockpurchase
    Created on : May 1, 2020, 1:10:25 PM
    Author     : azada
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%@ include file="login_checker_gist" %>

        <h1>Update Stock Purchase</h1>
        <form action="update_stockpurchase_action.jsp" method="post">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="location">Shop Branch of Stock Purchase: </label>
                <input type="text" id="location" required name="" value="${param.location}" disabled />
                <br/>
                <label for="purchase_date">Date: </label>
                <input type="date" id="purchase_date" required name="purchaseDate" value="${param.purchaseDate}" />
                <input type="hidden" name="purchaseId" value="${param.purchaseId}" />

                <input type="submit" value="Update" />
            </fieldset>
        </form>
    </body>
</html>
