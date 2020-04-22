<%-- 
    Document   : action_register_user
    Created on : Apr 22, 2020, 7:27:05 PM
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
        <jsp:useBean id="userRegistrationDetails" class="Beans.User">
            <jsp:setProperty name="userRegistrationDetails" property="*" />
        </jsp:useBean>
        <c:choose>
            <c:when test="${userRegistrationDetails.doesUserExist()}">
                <c:set var="error_msg" value="Username already exists" scope="request" />
                <jsp:forward page="register_user.jsp" />
            </c:when>
            <c:when test="${userRegistrationDetails.registerToSystem()}">
                <jsp:forward page="register_user_success.jsp" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Failed to register" scope="request"/>
                <jsp:forward page="register_user.jsp" />
            </c:otherwise>
        </c:choose>
    </body>
</html>
