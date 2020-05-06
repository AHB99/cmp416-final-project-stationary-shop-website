<%-- 
    Document   : select_seller_item_info
    Created on : May 5, 2020, 6:15:05 PM
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

        <jsp:useBean id="itemMgr" class="Beans.ItemMgr" />
        <%itemMgr.retrieveItemsNotSoldByShop(Integer.parseInt(request.getParameter("shopId")));%>
        <c:if test="${itemMgr.isEmpty()}">
            <c:set var="error_msg" value="Error! No unmatched items available" scope="request" />
            <jsp:forward page="action_outcome.jsp" />
        </c:if>
        <h1>Select Item(s)</h1>
        <form action="insert_seller_item_action.jsp">
            <fieldset>
                <label for="item_id">Item(s): </label><br/>
                <select id="item_id" name="itemIds" multiple="multiple">
                    <c:forEach items="${itemMgr.itemList}" var="item">
                        <option value="${item.itemId}">${item.itemName}</option>
                    </c:forEach>        
                </select><br/>
                <input type="hidden" name="shopId" value="${param.shopId}" />
                <input type="submit" value="Insert" />
            </fieldset>
        </form>
    </body>
</html>
