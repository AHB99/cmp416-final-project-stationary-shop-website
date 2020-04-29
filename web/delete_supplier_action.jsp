<%-- 
    Document   : delete_supplier_action
    Created on : Apr 29, 2020, 5:29:51 PM
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
        <jsp:useBean id="supplierToDelete" class="Beans.Supplier">
            <jsp:setProperty name="supplierToDelete" property="*" />
        </jsp:useBean>
        <c:choose>
            <c:when test="${supplierToDelete.deleteSupplier()}" >
                <c:set var="success_msg" value="Successfully deleted supplier!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error deleting supplier!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
