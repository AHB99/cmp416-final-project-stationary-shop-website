<%-- 
    Document   : view_department
    Created on : Apr 26, 2020, 12:25:51 AM
    Author     : azada
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Departments</title>
    </head>
    <body>
        <h1>All Departments</h1>
        <jsp:useBean id="departmentMgr" class="Beans.DepartmentMgr"/>
        ${departmentMgr.retrieveDepartments()}
        <table border="1">
            <thead>
                <tr>
                    <th>
                        Department Name
                    </th>
                    <th>
                        Delete
                    </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${departmentMgr.departmentList}" var="dep">
                    <tr>
                        <td>${dep.departmentName}</td>
                        <form action="delete_department_action.jsp">
                            <input type="hidden" name="departmentId" value="${dep.departmentId}"/>
                            <td><input type="submit" value="Delete" /></td>
                        </form>
                    </tr>                 
                </c:forEach>
            </tbody>
        </table>
        <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form>        
    </body>
</html>
