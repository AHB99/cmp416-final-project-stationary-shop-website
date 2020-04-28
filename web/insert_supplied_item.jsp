<%-- 
    Document   : insert_supplied_item
    Created on : Apr 28, 2020, 10:29:17 PM
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
        <jsp:useBean id="supplierMgr" class="Beans.SupplierMgr" />
        ${supplierMgr.retrieveSuppliers()}
        <jsp:useBean id="itemMgr" class="Beans.ItemMgr" />
        ${itemMgr.retrieveItems()}

        
        <h1>Match Item for Supplier</h1>
        
        <form action="insert_supplied_item_action.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="supplier_id">Supplier: </label>
                <select id="supplier_id" name="supplierId">
                    <c:forEach items="${supplierMgr.supplierList}" var="supplier">
                        <option value="${supplier.supplierId}">${supplier.supplierName}</option>
                    </c:forEach>        
                </select><br/>
                <label for="item_id">Item: </label>
                <select id="item_id" name="itemId">
                    <c:forEach items="${itemMgr.itemList}" var="item">
                        <option value="${item.itemId}">${item.itemName}</option>
                    </c:forEach>        
                </select><br/>
                

                <label for="supplier_price">Supplier Price: </label>
                <input type="number" id = "supplier_price" name="supplierPrice" value="" /><br/>

                <input type="submit" value="Insert" />
            </fieldset>
        </form>
    </body>
</html>
