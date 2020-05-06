<%-- 
    Document   : update_shopsale
    Created on : May 1, 2020, 6:23:28 PM
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

        <h1>Update Shop Sale</h1>
        <form action="update_shopsale_action.jsp" method="post">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="location">Shop Branch of Sale: </label>
                <input type="text" id="location" name="" value="${param.location}" disabled />

                <br/>
                <label for="sale_date">Date: </label>
                <input type="date" id="sale_date" required name="saleDate" value="${param.saleDate}" /><br/>
                <input type="hidden" name="saleId" value="${param.saleId}" />

                <input type="submit" value="Update" />
            </fieldset>
        </form>
    </body>
</html>
