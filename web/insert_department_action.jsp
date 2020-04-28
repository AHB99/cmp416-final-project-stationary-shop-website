<%-- 
    Document   : insert_department_action
    Created on : Apr 26, 2020, 12:10:32 AM
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
        <jsp:useBean id="departmentToInsert" class="Beans.Department">
            <jsp:setProperty name="departmentToInsert" property="*" />
        </jsp:useBean>
        
        <c:choose>
            <c:when test="${departmentToInsert.insertDepartment()}" >
                <c:set var="success_msg" value="Successfully inserted department!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error inserting department!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
