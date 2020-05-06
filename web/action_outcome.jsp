<%-- 
    Document   : action_outcome
    Created on : Apr 26, 2020, 12:15:39 AM
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

        <c:choose>
            <c:when test="${!empty success_msg}">
                <h1>${success_msg}</h1>
            </c:when>
            <c:when test="${!empty error_msg}">
                <h1>${error_msg}</h1>
            </c:when>  
        </c:choose>
        <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form>        
    </body>
</html>
