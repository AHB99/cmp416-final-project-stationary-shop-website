<%-- 
    Document   : insert_entity
    Created on : Apr 26, 2020, 12:05:53 AM
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
                <jsp:forward page="insert_department.jsp" />
            </c:when>
            <c:when test="${param.entity_choice == 'shop_branch'}">
                <jsp:forward page="insert_shop_branch.jsp" />
            </c:when>
            <c:when test="${param.entity_choice == 'employee'}">
                <jsp:forward page="insert_employee.jsp" />
            </c:when>
            <c:when test="${param.entity_choice == 'brand'}">
                <jsp:forward page="insert_brand.jsp" />
            </c:when>
        </c:choose>
    </body>
</html>
