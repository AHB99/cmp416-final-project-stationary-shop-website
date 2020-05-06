<%-- 
    Document   : update_department
    Created on : Apr 29, 2020, 6:09:21 PM
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

        <jsp:useBean id="selectedDepartment" class="Beans.Department">
            <jsp:setProperty name="selectedDepartment" property="*"/>
        </jsp:useBean>
        ${selectedDepartment.retrieveDepartment()}
        <h1>Update Department</h1>
        <form action="update_department_action.jsp" method="post">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="department_name">Department Name: </label>
                <input type="text" id = "department_name" required name="departmentName" value="${selectedDepartment.departmentName}" /><br/>
                <input type="hidden" name="departmentId" value="${selectedDepartment.departmentId}" />
                <input type="submit" value="Update" />
            </fieldset>
        </form>
    </body>
</html>
