<%-- 
    Document   : insert_shop_branch
    Created on : Apr 26, 2020, 12:45:11 AM
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

        <h1>Insert New Shop Branch</h1>
        <form action="insert_shop_branch_action.jsp" method="post">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="location">Location: </label>
                <input type="text" id = "location" required name="location" value="" /><br/>
                <label for="square_footage">Square Footage </label>
                <input type="number" id = "square_footage" required step="0.01" min="0" name="squareFootage" value="" /><br/>
                <input type="submit" value="Insert" />
            </fieldset>
        </form>
    </body>
</html>
