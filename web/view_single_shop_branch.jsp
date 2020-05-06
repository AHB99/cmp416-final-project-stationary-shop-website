<%-- 
    Document   : view_single_shop_branch
    Created on : Apr 28, 2020, 7:08:02 PM
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

        <jsp:useBean id="selectedShopBranch" class="Beans.ShopBranch">
            <jsp:setProperty name="selectedShopBranch" property="*"/>
        </jsp:useBean>
        ${selectedShopBranch.retrieveShopBranch()}
        <h1>Shop Branch Info</h1>
        <table border="1">
            <tr>
                <th scope="row">Location: </th><td>${selectedShopBranch.location}</td>
            </tr>
            <tr>
                <th scope="row">Square Footage: </th><td>${selectedShopBranch.squareFootage}</td>
            </tr>
        </table>
        <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 
    </body>
</html>
