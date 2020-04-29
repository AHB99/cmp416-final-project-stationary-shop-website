<%-- 
    Document   : update_item_action
    Created on : Apr 29, 2020, 8:24:31 PM
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
        <jsp:useBean id="itemToUpdate" class="Beans.Item">
            <jsp:setProperty name="itemToUpdate" property="*" />
        </jsp:useBean>
        
        <c:if test="${!empty param.brandId}">
            <jsp:useBean id="itemBrandToUpdate" class="Beans.Brand">
                <jsp:setProperty name="itemBrandToUpdate" property="brandId" param="brandId" />
            </jsp:useBean>
            <c:set target="${itemToUpdate}" property="itemBrand" value="${itemBrandToUpdate}" /> 
        </c:if>

        <c:choose>
            <c:when test="${itemToUpdate.updateItem()}" >
                <c:set var="success_msg" value="Successfully updated item!" scope="request" />
            </c:when>
            <c:otherwise>
                <c:set var="error_msg" value="Error updating item!" scope="request" />
            </c:otherwise>
        </c:choose>
        <jsp:forward page="action_outcome.jsp" />
    </body>
</html>
