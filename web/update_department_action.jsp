<%-- 
    Document   : update_department_action
    Created on : Apr 29, 2020, 6:13:16 PM
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

        <jsp:useBean id="departmentToUpdate" class="Beans.Department">
            <jsp:setProperty name="departmentToUpdate" property="*" />
        </jsp:useBean>

        <c:choose>
            <c:when test="${departmentToUpdate.updateDepartment()}" >
                <c:set var="success_msg" value="Successfully updated department!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error updating department!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
