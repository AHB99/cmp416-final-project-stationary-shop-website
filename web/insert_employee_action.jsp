<%-- 
    Document   : insert_employee_action
    Created on : Apr 27, 2020, 11:36:45 PM
    Author     : azada
--%>
<%@page import="Beans.Department"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <jsp:useBean id="employeeToInsert" class="Beans.Employee">
            <jsp:setProperty name="employeeToInsert" property="*" />
        </jsp:useBean>

        <c:if test="${!empty param.departmentId}">
            <jsp:useBean id="employeeDepartmentToInsert" class="Beans.Department">
                <jsp:setProperty name="employeeDepartmentToInsert" property="departmentId" param="departmentId" />
            </jsp:useBean>
            <c:set target="${employeeToInsert}" property="department" value="${employeeDepartmentToInsert}" /> 
        </c:if>

        <c:if test="${!empty param.shopId}">
            <jsp:useBean id="employeeShopToInsert" class="Beans.ShopBranch">
                <jsp:setProperty name="employeeShopToInsert" property="shopId" param="shopId" />
            </jsp:useBean>
            <c:set target="${employeeToInsert}" property="shopBranch" value="${employeeShopToInsert}" /> 
        </c:if>

        <c:if test="${!empty param.supervisorId and param.supervisorId != ''}">
            <jsp:useBean id="employeeSupervisorToInsert" class="Beans.Employee">
                <jsp:setProperty name="employeeSupervisorToInsert" property="employeeId" param="supervisorId" />
            </jsp:useBean>
            <c:set target="${employeeToInsert}" property="supervisor" value="${employeeSupervisorToInsert}" /> 
        </c:if>

        <c:choose >
            <c:when test="${employeeToInsert.insertEmployee()}">
                <c:set var="success_msg" value="Successfully inserted employee!" scope="request" />

            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error inserting employee!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
