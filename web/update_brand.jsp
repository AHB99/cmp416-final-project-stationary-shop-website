<%-- 
    Document   : update_brand
    Created on : Apr 29, 2020, 8:08:06 PM
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
        <jsp:useBean id="selectedBrand" class="Beans.Brand">
            <jsp:setProperty name="selectedBrand" property="*"/>
        </jsp:useBean>
        ${selectedBrand.retrieveBrand()}
        <h1>Update Brand</h1>
        <form action="update_brand_action.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="brand_name">Brand Name: </label>
                <input type="text" id = "brand_name" name="brandName" value="${selectedBrand.brandName}" /><br/>
                <input type="hidden" name="brandId" value="${selectedBrand.brandId}" /><br/>

                <input type="submit" value="Update" />
            </fieldset>
        </form>
    </body>
</html>
