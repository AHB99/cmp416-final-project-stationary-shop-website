<%-- 
    Document   : insert_supplied_item_action
    Created on : Apr 28, 2020, 10:35:01 PM
    Author     : azada
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%@ include file="login_checker_gist" %>

        <jsp:useBean id="suppliedItemToInsert" class="Beans.SuppliedItem">
            <jsp:setProperty name="suppliedItemToInsert" property="*" />
        </jsp:useBean>        
        
        <jsp:useBean id="suppliedItemSupplierToInsert" class="Beans.Supplier">
            <jsp:setProperty name="suppliedItemSupplierToInsert" property="*" />
        </jsp:useBean>
        <c:set target="${suppliedItemToInsert}" property="supplier" value="${suppliedItemSupplierToInsert}" /> 
        
        <jsp:useBean id="suppliedItemItemToInsert" class="Beans.Item">
            <jsp:setProperty name="suppliedItemItemToInsert" property="*" />
        </jsp:useBean>
        <c:set target="${suppliedItemToInsert}" property="item" value="${suppliedItemItemToInsert}" /> 
        
        <c:choose >
            <c:when test="${suppliedItemToInsert.insertSuppliedItem()}">
                <c:set var="success_msg" value="Successfully matched supplier and item!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error matching supplier and item!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
