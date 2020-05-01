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
        <jsp:useBean id="departmentMgr" class="Beans.DepartmentMgr" />
        ${departmentMgr.retrieveDepartments()}
        <jsp:useBean id="shopBranchMgr" class="Beans.ShopBranchMgr" />
        ${shopBranchMgr.retrieveShopBranches()}
        
        <fieldset>
            <legend>Filter By:</legend>
            <form action="view_employee.jsp">
                <label for="department">Department: </label>
                <select id="department" name="departmentId">
                    <c:forEach items="${departmentMgr.departmentList}" var="department">
                        <option value="${department.departmentId}">${department.departmentName}</option>
                    </c:forEach>        
                </select>
                <input type="hidden" name="filter_by" value="department_fil"/>
                <input type="submit" value="Filter by Department" /><br/>
            </form>
            <form action="view_employee.jsp">
                <label for="shop">Shop Branch: </label>
                <select id="shop" name="shopId">
                    <c:forEach items="${shopBranchMgr.shopList}" var="shop">
                        <option value="${shop.shopId}">${shop.location}</option>
                    </c:forEach>        
                </select>
                <input type="hidden" name="filter_by" value="shop_branch_fil"/>
                <input type="submit" value="Filter by Shop Branch" /><br/>
            </form>
            <form action="view_employee.jsp">
                <input type="hidden" name="filter_by" value=""/>
                <input type="submit" value="Clear Filters" /><br/>
            </form>
        </fieldset>
        <br/>
        <c:choose>
            <c:when test="${param.filter_by.equals('department_fil')}">
                <%employeeMgr.retrieveEmployeesByDepartment(Integer.parseInt(request.getParameter("departmentId")));%>
            </c:when>
            <c:when test="${param.filter_by.equals('shop_branch_fil')}">
                <%employeeMgr.retrieveEmployeesByShop(Integer.parseInt(request.getParameter("shopId")));%>
            </c:when>
            <c:otherwise>
                ${employeeMgr.retrieveEmployees()}
            </c:otherwise>
        </c:choose>
        
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
                    <th>Update</th>
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
                <form action="update_employee.jsp">
                    <input type="hidden" name="employeeId" value="${employee.employeeId}"/>

                    <td><input type="submit" value="Update" /></td>
                </form>
            </tr>
        </c:forEach>
    </tbody>
</table>
<form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 
</body>
</html>
