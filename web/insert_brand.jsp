<%-- 
    Document   : insert_brand
    Created on : Apr 28, 2020, 7:29:12 PM
    Author     : azada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Insert New Brand</h1>
        <form action="insert_brand_action.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="brand_name">Brand Name: </label>
                <input type="text" id = "brand_name" name="brandName" value="" /><br/>
                <input type="submit" value="Insert" />
            </fieldset>
        </form>
    </body>
</html>
