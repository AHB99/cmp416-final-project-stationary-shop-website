<%-- 
    Document   : insert_single_stockpurchase_item
    Created on : May 5, 2020, 6:39:42 PM
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
        <h1>Select Supplier</h1>
        <form action="select_single_stockpurchase_item_info.jsp">
            <fieldset>
                <label for="supplier_id">Supplier: </label>
                <select id="supplier_id" name="supplierId">
                    <c:forEach items="${supplierMgr.supplierList}" var="supplier">
                        <option value="${supplier.supplierId}">${supplier.supplierName}</option>
                    </c:forEach>        
                </select><br/>
                <input type="hidden" name="purchaseId" value="${param.purchaseId}" />
                <input type="submit" value="Select" />
            </fieldset>
        </form>
    </body>
</html>
