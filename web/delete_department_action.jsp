<%-- 
    Document   : delete_department_action
    Created on : Apr 29, 2020, 4:47:30 PM
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
        <jsp:useBean id="departmentToDelete" class="Beans.Department">
            <jsp:setProperty name="departmentToDelete" property="*" />
        </jsp:useBean>
        <c:choose>
            <c:when test="${departmentToDelete.deleteDepartment()}" >
                <c:set var="success_msg" value="Successfully deleted department!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error deleting department!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
