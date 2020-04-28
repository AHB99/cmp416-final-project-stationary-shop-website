<%-- 
    Document   : insert_brand_action
    Created on : Apr 28, 2020, 7:30:11 PM
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
        <jsp:useBean id="brandToInsert" class="Beans.Brand">
            <jsp:setProperty name="brandToInsert" property="*" />
        </jsp:useBean>

    <c:choose>
        <c:when test="${brandToInsert.insertBrand()}" >
            <c:set var="success_msg" value="Successfully inserted brand!" scope="request" />
        </c:when>
        <c:otherwise>
            <c:set var="error_msg" value="Error inserting brand!" scope="request" />
        </c:otherwise>
    </c:choose>
    <jsp:forward page="action_outcome.jsp" />    </body>
</html>
