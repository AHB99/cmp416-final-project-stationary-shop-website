<%-- 
    Document   : register_user
    Created on : Apr 22, 2020, 7:21:59 PM
    Author     : azada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Register</h1>
        <form action="action_register_user.jsp">
            <fieldset>
                <label for="uname">Username:</label>
                <input id="uname" type="text" name="uname" value="" required/>
                <label for="pw">Password</label>
                <input id="pw" type="password" name="pw" value="" required/>
                <label for="fname">First name</label>
                <input id="fname" type="text" name="fname" value="" required />
                <label for="lname">Last name</label>
                <input id="lname" type="text" name="lname" value="" required/>
            </fieldset>
            <input type="submit" value="Register" />
        </form>
    </body>
</html>
