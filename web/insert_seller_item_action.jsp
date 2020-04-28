<%-- 
    Document   : insert_seller_item_action
    Created on : Apr 28, 2020, 11:03:43 PM
    Author     : azada
--%>
<%@page import="Beans.SellerItem"%>
<%@page import="Beans.Item"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="sellerItemShopToInsert" class="Beans.ShopBranch">
            <jsp:setProperty name="sellerItemShopToInsert" property="*" />
        </jsp:useBean>
        <c:set var="didFail" value="${false}" />
        
        <%
            boolean didFail = false;
            for (String itemId : request.getParameterValues("itemIds")){
                SellerItem sellerItemToInsert = 
                        new SellerItem(sellerItemShopToInsert, 
                                new Item(Integer.parseInt(itemId)));
                didFail = sellerItemToInsert.insertSellerItem();
            }
            if (didFail){
        %>
        <c:set var="success_msg" value="Successfully matched supplier and item(s)!" scope="request" />

        <%
            } else{
        %>
        <c:set var="error_msg" value="Error matching supplier and item!" scope="request" />

        <%
        }%>
        <jsp:forward page="action_outcome.jsp" />

    </body>
</html>
