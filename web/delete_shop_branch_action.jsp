<%-- 
    Document   : delete_shop_branch_action
    Created on : Apr 29, 2020, 5:21:02 PM
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

        <jsp:useBean id="shopBranchToDelete" class="Beans.ShopBranch">
            <jsp:setProperty name="shopBranchToDelete" property="*" />
        </jsp:useBean>
        <c:choose>
            <c:when test="${shopBranchToDelete.hasEmployees()}" >
                <c:set var="success_msg" value="Error! Reassign employees before deleting shop branch" scope="request" />
            </c:when>
            <c:when test="${shopBranchToDelete.deleteShopBranch()}" >
                <c:set var="success_msg" value="Successfully deleted department!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error deleting department!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
