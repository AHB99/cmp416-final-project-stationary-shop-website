<%-- 
    Document   : view_single_department
    Created on : Apr 28, 2020, 6:58:07 PM
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
        <jsp:useBean id="selectedDepartment" class="Beans.Department">
            <jsp:setProperty name="selectedDepartment" property="*"/>
        </jsp:useBean>
        ${selectedDepartment.retrieveDepartment()}
        <h1>Department Info</h1>
        <table border="1">
            <tr>
                <th scope="row">Name: </th><td>${selectedDepartment.departmentName}</td>
            </tr>
        </table>
        <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 

    </body>
</html>
