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
        <%
            if (Beans.Department.insertDepartment(request.getParameter("department_name"))){        
        %>
            <c:set var="success_msg" value="Successfully inserted department!" scope="request" />
        <%
            } else{
        %>
            <c:set var="error_msg" value="Error inserting department!" scope="request" />
        <%  }%>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
