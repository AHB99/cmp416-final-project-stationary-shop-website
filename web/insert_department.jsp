<%-- 
    Document   : insert_department
    Created on : Apr 26, 2020, 12:07:46 AM
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

        <h1>Insert New Department</h1>
        <form action="insert_department_action.jsp" method="post">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="department_name">Department Name: </label>
                <input type="text" id = "department_name" required name="departmentName" value="" /><br/>
                <input type="submit" value="Insert" />
            </fieldset>
        </form>
    </body>
</html>
