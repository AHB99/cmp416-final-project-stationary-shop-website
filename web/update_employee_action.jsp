<%-- 
    Document   : update_employee_action
    Created on : Apr 29, 2020, 7:35:52 PM
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
        <jsp:useBean id="employeeToUpdate" class="Beans.Employee">
            <jsp:setProperty name="employeeToUpdate" property="*" />
        </jsp:useBean>

        <c:if test="${!empty param.departmentId}">
            <jsp:useBean id="employeeDepartmentToUpdate" class="Beans.Department">
                <jsp:setProperty name="employeeDepartmentToUpdate" property="departmentId" param="departmentId" />
            </jsp:useBean>
            <c:set target="${employeeToUpdate}" property="department" value="${employeeDepartmentToUpdate}" /> 
        </c:if>

        <c:if test="${!empty param.shopId}">
            <jsp:useBean id="employeeShopToUpdate" class="Beans.ShopBranch">
                <jsp:setProperty name="employeeShopToUpdate" property="shopId" param="shopId" />
            </jsp:useBean>
            <c:set target="${employeeToUpdate}" property="shopBranch" value="${employeeShopToUpdate}" /> 
        </c:if>

        <c:if test="${!empty param.supervisorId  and param.supervisorId != ''}">
            <jsp:useBean id="employeeSupervisorToUpdate" class="Beans.Employee">
                <jsp:setProperty name="employeeSupervisorToUpdate" property="employeeId" param="supervisorId" />
            </jsp:useBean>
            <c:set target="${employeeToUpdate}" property="supervisor" value="${employeeSupervisorToUpdate}" /> 
        </c:if>

        <c:choose >
            <c:when test="${employeeToUpdate.updateEmployee()}">
                <c:set var="success_msg" value="Successfully inserted employee!" scope="request" />

            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error inserting employee!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
    </body>
</html>
