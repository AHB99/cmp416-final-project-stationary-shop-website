<%-- 
    Document   : delete_supplied_item_action
    Created on : Apr 29, 2020, 5:42:07 PM
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
        <jsp:useBean id="suppliedItemToDelete" class="Beans.SuppliedItem"/>
        
        <jsp:useBean id="suppliedItemSupplierToDelete" class="Beans.Supplier">
            <jsp:setProperty name="suppliedItemSupplierToDelete" property="supplierId" param="supplierId" />
        </jsp:useBean>
        <c:set target="${suppliedItemToDelete}" property="supplier" value="${suppliedItemSupplierToDelete}" /> 
        
        <jsp:useBean id="suppliedItemItemToDelete" class="Beans.Item">
            <jsp:setProperty name="suppliedItemItemToDelete" property="itemId" param="itemId" />
        </jsp:useBean>
        <c:set target="${suppliedItemToDelete}" property="item" value="${suppliedItemItemToDelete}" /> 
        
        <c:choose>
            <c:when test="${suppliedItemToDelete.deleteSuppliedItem()}" >
                <c:set var="success_msg" value="Successfully disassociated item with supplier!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error disassociating item with supplier!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
