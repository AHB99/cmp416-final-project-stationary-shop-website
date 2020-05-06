<%-- 
    Document   : insert_department
    Created on : Apr 26, 2020, 12:07:46 AM
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
        <h1>Insert New Department</h1>
        <form action="insert_department_action.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="department_name">Department Name: </label>
                <input type="text" id = "department_name" required name="departmentName" value="" /><br/>
                <input type="submit" value="Insert" />
            </fieldset>
        </form>
    </body>
</html>
