<%-- 
    Document   : login_action
    Created on : Apr 22, 2020, 8:56:37 PM
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
        <c:remove var="loginUser" scope="session" />
        <jsp:useBean id="loginUser" class="Beans.User" scope="session">
            <jsp:setProperty name="loginUser" property="*" />
        </jsp:useBean>
        <c:choose>
            <c:when test="${!(loginUser.doesUserExist())}">
                <c:set var="login_error_msg" value="Username does not exist" scope="request" />
                <jsp:forward page="login.jsp" />
            </c:when>
            <c:when test="${loginUser.loginToSystem()}">
                <jsp:forward page="home.jsp" />
            </c:when>
            <c:otherwise>
                <c:set var="login_error_msg" value="Failed to login" scope="request"/>
                <jsp:forward page="login.jsp" />
            </c:otherwise>
        </c:choose>
    </body>
</html>
