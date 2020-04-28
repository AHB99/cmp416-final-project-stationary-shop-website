<%-- 
    Document   : insert_item_action
    Created on : Apr 28, 2020, 7:48:56 PM
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
        <jsp:useBean id="itemToInsert" class="Beans.Item">
            <jsp:setProperty name="itemToInsert" property="*" />
        </jsp:useBean>
        <c:choose >
            <c:when test="${itemToInsert.insertItem()}">
                <c:set var="success_msg" value="Successfully inserted item!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error inserting item!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
