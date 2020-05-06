<%-- 
    Document   : update_employee
    Created on : Apr 29, 2020, 7:22:25 PM
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

        <h1>Update Employee</h1>
        <jsp:useBean id="selectedEmployee" class="Beans.Employee">
            <jsp:setProperty name="selectedEmployee" property="*"/>
        </jsp:useBean>
        ${selectedEmployee.retrieveEmployee()}

        <jsp:useBean id="employeeMgr" class="Beans.EmployeeMgr" />
        ${employeeMgr.retrieveEmployees()}
        <jsp:useBean id="departmentMgr" class="Beans.DepartmentMgr" />
        ${departmentMgr.retrieveDepartments()}
        <jsp:useBean id="shopBranchMgr" class="Beans.ShopBranchMgr" />
        ${shopBranchMgr.retrieveShopBranches()}



        <form action="update_employee_action.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="first_name">First Name: </label>
                <input type="text" id = "first_name" required name="firstName" value="${selectedEmployee.firstName}" /><br/>
                <label for="last_name">Last Name: </label>
                <input type="text" id = "last_name" required name="lastName" value="${selectedEmployee.lastName}" /><br/>
                <label>Gender:</label><br/>
                <c:choose>
                    <c:when test="${selectedEmployee.gender.equals('M')}">
                        <label for="genderM">Male:</label>
                        <input type="radio" id="genderM" name="gender" value="M" checked /><br/>
                        <label for="genderF">Female:</label>
                        <input type="radio" id="genderF" name="gender" value="F" /><br/>
                    </c:when>
                    <c:otherwise>
                        <label for="genderM">Male:</label>
                        <input type="radio" id="genderM" name="gender" value="M"/>
                        <label for="genderF">Female:</label>
                        <input type="radio" id="genderF" name="gender" value="F" checked/><br/>
                    </c:otherwise>
                </c:choose>
                
                
                
                <label for="salary">Salary: </label>
                <input type="number" id = "salary" required name="salary" step="0.01" min="0" value="${selectedEmployee.salary}" /><br/>
                <label for="address">Address: </label>
                <input type="text" id = "address" required name="address" value="${selectedEmployee.address}" /><br/>

                <label for="departmentId">Department: </label>
                <select id="departmentId" name="departmentId">
                    <c:forEach items="${departmentMgr.departmentList}" var="department">
                        <c:choose>
                            <c:when test="${department.departmentId == selectedEmployee.department.departmentId}">
                                <option value="${department.departmentId}" selected>${department.departmentName}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${department.departmentId}">${department.departmentName}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>        
                </select><br/>
                <label for="shopId">Shop Branch: </label>
                <select id="shopId" name="shopId">
                    
                    <c:forEach items="${shopBranchMgr.shopList}" var="shop">
                        <c:choose>
                            <c:when test="${shop.shopId == selectedEmployee.shopBranch.shopId}">
                                    <option value="${shop.shopId}" selected>${shop.location}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${shop.shopId}">${shop.location}</option>
                                </c:otherwise>
                        </c:choose>
                    </c:forEach>        
                </select><br/>
                <label for="supervisorId">Supervisor: </label>
                <select id="supervisorId" name="supervisorId">
                    <option value="">None</option>
                    <c:forEach items="${employeeMgr.employeeList}" var="employee">
                        <c:if test="${employee.employeeId != selectedEmployee.employeeId}">
                            <c:choose>
                                <c:when test="${employee.employeeId == selectedEmployee.supervisor.employeeId}">
                                    <option value="${employee.employeeId}" selected>${employee.firstName} ${employee.lastName}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${employee.employeeId}">${employee.firstName} ${employee.lastName}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </c:forEach>        
                </select><br/>

                <input type="hidden" name="employeeId" value="${selectedEmployee.employeeId}" />
                <input type="submit" value="Update" />
            </fieldset>
        </form>
    </body>
</html>
