<%-- 
    Document   : select_supplied_item_info
    Created on : May 5, 2020, 6:05:48 PM
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
        <jsp:useBean id="itemMgr" class="Beans.ItemMgr" />
        <%itemMgr.retrieveItemsNotSuppliedBySupplier(Integer.parseInt(request.getParameter("supplierId")));%>
        <h1>Select Item</h1>
        <c:if test="${itemMgr.isEmpty()}">
            <c:set var="error_msg" value="Error! No unmatched items available" scope="request" />
            <jsp:forward page="action_outcome.jsp" />
        </c:if>
        <form action="insert_supplied_item_action.jsp">
            <fieldset>
                <label for="item_id">Item: </label>
                <select id="item_id" name="itemId">
                    <c:forEach items="${itemMgr.itemList}" var="item">
                        <option value="${item.itemId}">${item.itemName}</option>
                    </c:forEach>        
                </select><br/>


                <label for="supplier_price">Supplier Price: </label>
                <input type="number" id = "supplier_price" name="supplierPrice" value="" /><br/>
                <input type="hidden" name="supplierId" value="${param.supplierId}" />

                <input type="submit" value="Insert" />
            </fieldset>
        </form>
    </body>
</html>
