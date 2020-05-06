<%-- 
    Document   : update_supplied_item_action
    Created on : Apr 29, 2020, 8:43:41 PM
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

        <jsp:useBean id="suppliedItemToUpdate" class="Beans.SuppliedItem">
            <jsp:setProperty name="suppliedItemToUpdate" property="*" />
        </jsp:useBean>        

        <jsp:useBean id="suppliedItemSupplierToUpdate" class="Beans.Supplier">
            <jsp:setProperty name="suppliedItemSupplierToUpdate" property="*" />
        </jsp:useBean>
        <c:set target="${suppliedItemToUpdate}" property="supplier" value="${suppliedItemSupplierToUpdate}" /> 

        <jsp:useBean id="suppliedItemItemToUpdate" class="Beans.Item">
            <jsp:setProperty name="suppliedItemItemToUpdate" property="*" />
        </jsp:useBean>
        <c:set target="${suppliedItemToUpdate}" property="item" value="${suppliedItemItemToUpdate}" /> 

        <c:choose >
            <c:when test="${suppliedItemToUpdate.updateSuppliedItem()}">
                <c:set var="success_msg" value="Successfully updated supplier's item price!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error updating supplier's item price!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
