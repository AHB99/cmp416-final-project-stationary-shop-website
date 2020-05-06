<%-- 
    Document   : insert_supplier_action
    Created on : Apr 28, 2020, 8:05:13 PM
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

        <jsp:useBean id="supplierToInsert" class="Beans.Supplier">
            <jsp:setProperty name="supplierToInsert" property="*" />
        </jsp:useBean>
        <c:choose >
            <c:when test="${supplierToInsert.insertSupplier()}">
                <c:set var="success_msg" value="Successfully inserted supplier!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error inserting supplier!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
