<%-- 
    Document   : update_supplied_item
    Created on : Apr 29, 2020, 8:35:42 PM
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
        <jsp:useBean id="selectedSuppliedItem" class="Beans.SuppliedItem"/>
        
        <jsp:useBean id="selectedSuppliedItemSupplier" class="Beans.Supplier">
            <jsp:setProperty name="selectedSuppliedItemSupplier" property="supplierId" param="supplierId" />
        </jsp:useBean>
        <c:set target="${selectedSuppliedItem}" property="supplier" value="${selectedSuppliedItemSupplier}" /> 

        <jsp:useBean id="selectedSuppliedItemItem" class="Beans.Item">
            <jsp:setProperty name="selectedSuppliedItemItem" property="itemId" param="itemId" />
        </jsp:useBean>
        <c:set target="${selectedSuppliedItem}" property="item" value="${selectedSuppliedItemItem}" />
        
        ${selectedSuppliedItem.retrieveSuppliedItem()}

        
        <h1>Update Item Price for Supplier</h1>

        <form action="update_supplied_item_action.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                
                <label for="supplier_name">Supplier: </label>
                <input type="text" id="supplier_id" name="supplierName" value="${selectedSuppliedItem.supplier.supplierName}" disabled ></input>
                <br/>
                <label for="item_name">Item: </label>
                <input type="text" id="item_name" name="itemName" value="${selectedSuppliedItem.item.itemName}" disabled ></input>
                <br/>


                <label for="supplier_price">Supplier Price: </label>
                <input type="number" id = "supplier_price" required step="0.01" min="0" name="supplierPrice" value="${selectedSuppliedItem.supplierPrice}" /><br/>
                
                <input type="hidden" name="supplierId" value="${selectedSuppliedItem.supplier.supplierId}" />
                <input type="hidden" name="itemId" value="${selectedSuppliedItem.item.itemId}" />

                <input type="submit" value="Update" />
            </fieldset>
        </form>
    </body>
</html>
