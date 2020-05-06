<%-- 
    Document   : update_item
    Created on : Apr 29, 2020, 8:16:47 PM
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
        <jsp:useBean id="selectedItem" class="Beans.Item">
            <jsp:setProperty name="selectedItem" property="*"/>
        </jsp:useBean>
        ${selectedItem.retrieveItem()}
        <jsp:useBean id="brandMgr" class="Beans.BrandMgr" />
        ${brandMgr.retrieveBrands()}
        <form action="update_item_action.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="item_name">Name: </label>
                <input type="text" id = "item_name" required name="itemName" value="${selectedItem.itemName}" /><br/>
                <label for="item_price">Price: </label>
                <input type="number" id = "item_price" required name="itemPrice" step="0.01" min="0" value="${selectedItem.itemPrice}" /><br/>
                <select id="brand_name" name="brandId">
                    <c:forEach items="${brandMgr.brandList}" var="brand">   
                        <c:choose>
                            <c:when test="${brand.brandId == selectedItem.itemBrand.brandId}">
                                <option value="${brand.brandId}" selected>${brand.brandName}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${brand.brandId}">${brand.brandName}</option>
                            </c:otherwise>
                        </c:choose>                           
                    </c:forEach>        
                </select><br/>
                <input type="hidden" name="itemId" value="${selectedItem.itemId}"/>
                <input type="submit" value="Update" />
            </fieldset>
        </form>
    </body>
</html>
