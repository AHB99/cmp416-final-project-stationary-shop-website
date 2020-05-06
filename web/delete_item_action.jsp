<%-- 
    Document   : delete_item_action
    Created on : Apr 29, 2020, 5:35:30 PM
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

        <jsp:useBean id="itemToDelete" class="Beans.Item">
            <jsp:setProperty name="itemToDelete" property="*" />
        </jsp:useBean>
        <c:choose>
            <c:when test="${itemToDelete.deleteItem()}" >
                <c:set var="success_msg" value="Successfully deleted item!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error deleting item!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
