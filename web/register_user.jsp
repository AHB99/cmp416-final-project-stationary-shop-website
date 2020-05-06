<%-- 
    Document   : register_user
    Created on : Apr 22, 2020, 7:21:59 PM
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
        <h1>Register</h1>
        <c:if test="${!empty error_msg}">
            <p style="color: red">${error_msg}</p>
        </c:if>
        <form action="register_user_action.jsp" method="post">
            <fieldset>
                <label for="username">Username:</label>
                <input id="username" type="text" name="username" value="" required/><br/>
                <label for="password">Password</label>
                <input id="password" type="password" name="password" value="" required/><br/>
                <label for="firstName">First name</label>
                <input id="firstName" type="text" name="firstName" value="" required /><br/>
                <label for="lastName">Last name</label>
                <input id="lastName" type="text" name="lastName" value="" required/><br/>
            </fieldset>
            <input type="submit" value="Register" />
        </form>
    </body>
</html>
