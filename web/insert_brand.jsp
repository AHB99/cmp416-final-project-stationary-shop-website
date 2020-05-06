<%-- 
    Document   : insert_brand
    Created on : Apr 28, 2020, 7:29:12 PM
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

        <h1>Insert New Brand</h1>
        <form action="insert_brand_action.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="brand_name">Brand Name: </label>
                <input type="text" id = "brand_name" required name="brandName" value="" /><br/>
                <input type="submit" value="Insert" />
            </fieldset>
        </form>
    </body>
</html>
