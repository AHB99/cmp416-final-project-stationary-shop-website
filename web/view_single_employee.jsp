<%-- 
    Document   : view_single_employee
    Created on : Apr 28, 2020, 7:14:00 PM
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

        <jsp:useBean id="selectedEmployee" class="Beans.Employee">
            <jsp:setProperty name="selectedEmployee" property="*"/>
        </jsp:useBean>
        ${selectedEmployee.retrieveEmployee()}
        <h1>Employee Info</h1>
        <table border="1">
            <tr>
                <th scope="row">First Name: </th><td>${selectedEmployee.firstName}</td>
            </tr>
            <tr>
                <th scope="row">Last Name: </th><td>${selectedEmployee.lastName}</td>
            </tr>
            <tr>
                <th scope="row">Gender: </th><td>${selectedEmployee.gender}</td>
            </tr>
            <tr>
                <th scope="row">Salary: </th><td>${selectedEmployee.salary}</td>
            </tr>
            <tr>
                <th scope="row">Address: </th><td>${selectedEmployee.address}</td>
            </tr>
            <tr>
                <th scope="row">Department </th><td>${selectedEmployee.department.departmentName}</td>
            </tr>
            <tr>
                <th scope="row">Shop Branch: </th>
            <form action="view_single_shop_branch.jsp" method="post">
                <input type="hidden" name="shopId" value="${selectedEmployee.shopBranch.shopId}"/>
                <td><input type="submit" value="View Shop Branch Info" /></td>
            </form>            
        </tr>
        <tr>
            <th scope="row">Supervisor: </th>
                <c:choose>
                    <c:when test="${selectedEmployee.supervisor.employeeId != 0}">
                <form action="view_single_employee.jsp" method="post">
                    <input type="hidden" name="employeeId" value="${selectedEmployee.supervisor.employeeId}"/>
                    <td><input type="submit" value="View Supervisor Info" /></td>
                </form>

                </c:when>
                <c:otherwise>
                    <td><input type="button" value="View Supervisor Info" disabled /></td>
                    </c:otherwise>
                </c:choose>
    </tr>
</table>
<form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form>     </body>
</html>
