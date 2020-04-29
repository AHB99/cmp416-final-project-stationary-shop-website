<%-- 
    Document   : delete_employee_action
    Created on : Apr 29, 2020, 5:26:54 PM
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
        <jsp:useBean id="employeeToDelete" class="Beans.Employee">
            <jsp:setProperty name="employeeToDelete" property="*" />
        </jsp:useBean>
        <c:choose>
            <c:when test="${employeeToDelete.deleteEmployee()}" >
                <c:set var="success_msg" value="Successfully deleted employee!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error deleting employee!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
