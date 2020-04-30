<%-- 
    Document   : delete_stockpurchases_item_action
    Created on : May 1, 2020, 1:12:20 AM
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
        <jsp:useBean id="stockPurchaseItemToDelete" class="Beans.StockPurchaseItem">
            <jsp:setProperty name="stockPurchaseItemToDelete" property="*" />
        </jsp:useBean>
        
        <jsp:useBean id="suppliedItemToDelete" class="Beans.SuppliedItem"/>
        
        <jsp:useBean id="supplierToDelete" class="Beans.Supplier">
            <jsp:setProperty name="supplierToDelete" property="supplierId" param="supplierId" />
        </jsp:useBean>
        <c:set target="${suppliedItemToDelete}" property="supplier" value="${supplierToDelete}" /> 

        <jsp:useBean id="itemToDelete" class="Beans.Item">
            <jsp:setProperty name="itemToDelete" property="itemId" param="itemId" />
        </jsp:useBean>
        <c:set target="${suppliedItemToDelete}" property="item" value="${itemToDelete}" /> 

        <c:set target="${stockPurchaseItemToDelete}" property="suppliedItem" value="${suppliedItemToDelete}" /> 

        
        <c:choose>
            <c:when test="${stockPurchaseItemToDelete.deleteStockPurchaseItem()}" >
                <c:set var="success_msg" value="Successfully deleted stock purchase item!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error deleting stpck purchase item!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
