<%-- 
    Document   : delete_brand_action
    Created on : Apr 29, 2020, 5:33:03 PM
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
        <jsp:useBean id="brandToDelete" class="Beans.Brand">
            <jsp:setProperty name="brandToDelete" property="*" />
        </jsp:useBean>
        <c:choose>
            <c:when test="${brandToDelete.deleteBrand()}" >
                <c:set var="success_msg" value="Successfully deleted brand!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error deleting brand!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
