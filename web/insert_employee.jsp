<%-- 
    Document   : insert_employee
    Created on : Apr 27, 2020, 11:18:07 PM
    Author     : azada
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Employee</title>
    </head>
    <body>
        <%@ include file="login_checker_gist" %>

        <h1>Insert New Employee</h1>
        <jsp:useBean id="employeeMgr" class="Beans.EmployeeMgr" />
        ${employeeMgr.retrieveEmployees()}
        <jsp:useBean id="departmentMgr" class="Beans.DepartmentMgr" />
        ${departmentMgr.retrieveDepartments()}
        <jsp:useBean id="shopBranchMgr" class="Beans.ShopBranchMgr" />
        ${shopBranchMgr.retrieveShopBranches()}
        
        <form action="insert_employee_action.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="first_name">First Name: </label>
                <input type="text" id = "first_name" required name="firstName" value="" /><br/>
                <label for="last_name">Last Name: </label>
                <input type="text" id = "last_name" required name="lastName" value="" /><br/>
                <label>Gender:</label>
                <label for="genderM">Male: </label>
                <input type="radio" id="genderM" name="gender" value="M" checked="checked" />
                <label for="genderF">Female: </label>
                <input type="radio" id="genderF" name="gender" value="F" /><br/>
                <label for="salary">Salary: </label>
                <input type="number" id = "salary" required step="0.01" min="0" name="salary" value="" /><br/>
                <label for="address">Address: </label>
                <input type="text" id = "address" required name="address" value="" /><br/>
                
                <label for="departmentId">Department: </label>
                <select id="departmentId" name="departmentId">
                    <c:forEach items="${departmentMgr.departmentList}" var="department">
                        <option value="${department.departmentId}">${department.departmentName}</option>
                    </c:forEach>        
                </select><br/>
                <label for="shopId">Shop Branch: </label>
                <select id="shopId" name="shopId">
                    <c:forEach items="${shopBranchMgr.shopList}" var="shop">
                        <option value="${shop.shopId}">${shop.location}</option>
                    </c:forEach>        
                </select><br/>
                <label for="supervisorId">Supervisor: </label>
                <select id="supervisorId" name="supervisorId">
                    <option value="">None</option>
                    <c:forEach items="${employeeMgr.employeeList}" var="employee">
                        <option value="${employee.employeeId}">${employee.firstName} ${employee.lastName}</option>
                    </c:forEach>        
                </select><br/>
                
                
                <input type="submit" value="Insert" />
            </fieldset>
        </form>
    </body>
</html>
