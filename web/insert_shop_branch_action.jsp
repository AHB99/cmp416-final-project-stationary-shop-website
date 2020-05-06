<%-- 
    Document   : insert_shop_branch_action
    Created on : Apr 26, 2020, 12:46:38 AM
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

        <jsp:useBean id="shopToInsert" class="Beans.ShopBranch">
            <jsp:setProperty name="shopToInsert" property="*" />
        </jsp:useBean>
        <c:choose >
            <c:when test="${shopToInsert.insertShopBranch()}">
                <c:set var="success_msg" value="Successfully inserted shop branch!" scope="request" />

            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error inserting shop branch!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
</body>
</html>
