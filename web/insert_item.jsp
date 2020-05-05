<%-- 
    Document   : insert_item
    Created on : Apr 28, 2020, 7:44:59 PM
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
        <h1>Insert New Item</h1>
        <jsp:useBean id="brandMgr" class="Beans.BrandMgr" />
        ${brandMgr.retrieveBrands()}
        <form action="insert_item_action.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="item_name">Name: </label>
                <input type="text" id = "item_name" name="itemName" value="" /><br/>
                <label for="item_price">Price: </label>
                <input type="number" id = "item_price" step="0.01" min="0" name="itemPrice" value="" /><br/>
                <select id="brand_name" name="brandId">
                    <c:forEach items="${brandMgr.brandList}" var="brand">
                        <option value="${brand.brandId}">${brand.brandName}</option>
                    </c:forEach>        
                </select><br/>

                <input type="submit" value="Insert" />
            </fieldset>
        </form>
    </body>
</html>
