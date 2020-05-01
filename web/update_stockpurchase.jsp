<%-- 
    Document   : update_stockpurchase
    Created on : May 1, 2020, 1:10:25 PM
    Author     : azada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <h1>Update Stock Purchase</h1>
        <form action="update_stockpurchase_action.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="shop_id">Shop Branch of Stock Purchase: </label>
                <input type="text" name="" value="${param.location}" disabled />
                <br/>
                <label for="purchase_date">Date: </label>
                <input type="date" id="purchase_date" name="purchaseDate" value="${param.purchaseDate}" />
                <input type="hidden" name="purchaseId" value="${param.purchaseId}" />

                <input type="submit" value="Update" />
            </fieldset>
        </form>
    </body>
</html>
