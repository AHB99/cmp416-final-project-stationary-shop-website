<%-- 
    Document   : view_item
    Created on : Apr 28, 2020, 7:50:16 PM
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
        <h1>All Items</h1>
        <jsp:useBean id="itemMgr" class="Beans.ItemMgr"/>
        ${itemMgr.retrieveItems()}
        <table border="1">
            <thead>
                <tr>
                    <th>
                        Name
                    </th>
                    <th>
                        Price
                    </th>
                    <th>
                        Brand
                    </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${itemMgr.itemList}" var="item">
                    <tr>
                        <td>${item.itemName}</td>
                        <td>${item.itemPrice}</td>
                        <td>${item.itemBrand}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 
    </body>
</html>