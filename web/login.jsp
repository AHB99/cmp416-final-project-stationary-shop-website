<%-- 
    Document   : login
    Created on : Apr 22, 2020, 7:21:52 PM
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
        <c:remove var="loginUser" scope="session"/>
        <h1>Login</h1>
        <c:if test="${!empty login_error_msg}">
            <p style="color: red">${login_error_msg}</p>
            <c:remove var="login_error_msg" scope="request"/>
        </c:if>

        <form action="login_action.jsp" method="post">
            <fieldset>
                <label for="username">Username:</label>
                <input id="username" type="text" name="username" value="" required/>
                <label for="password">Password</label>
                <input id="password" type="password" name="password" value="" required/>
            </fieldset>
            <input type="submit" value="Login" />
        </form>
        <a href="register_user.jsp">New user? Register here!</a>
    </body>
</html>
