<%-- 
    Document   : view_entity_action
    Created on : Apr 26, 2020, 12:24:49 AM
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
        <c:choose>
            <c:when test="${param.entity_choice == 'department'}">
                <jsp:forward page="view_department.jsp" />
            </c:when>
        </c:choose>
    </body>
</html>
