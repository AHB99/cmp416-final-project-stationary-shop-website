<%-- 
    Document   : view_employee
    Created on : Apr 28, 2020, 6:22:16 PM
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
        <h1>All Employees</h1>
        <jsp:useBean id="employeeMgr" class="Beans.EmployeeMgr"/>
        ${employeeMgr.retrieveEmployees()}
        <table border="1">
            <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Gender</th>
                    <th>Salary</th>
                    <th>Address</th>
                    <th>Department</th>
                    <th>Shop Branch</th>
                    <th>Supervisor</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${employeeMgr.employeeList}" var="employee">
                <tr>
                    <td>${employee.firstName}</td>
                    <td>${employee.lastName}</td>
                    <td>${employee.gender}</td>
                    <td>${employee.salary}</td>
                    <td>${employee.address}</td>
                    <td>${employee.department.departmentName}</td>

                    <form action="view_single_shop_branch.jsp">
                        <input type="hidden" name="shopId" value="${employee.shopBranch.shopId}"/>
                        <td><input type="submit" value="View Shop Branch Info" /></td>
                    </form>
                    <form action="view_single_employee.jsp">
                        <input type="hidden" name="employeeId" value="${employee.supervisor.employeeId}"/>
                        <td><input type="submit" value="View Supervisor Info" /></td>
                    </form>
                    <form action="delete_employee_action.jsp">
                        <input type="hidden" name="employeeId" value="${employee.employeeId}"/>
                        <td><input type="submit" value="Delete" /></td>
                    </form>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 
</body>
</html>
