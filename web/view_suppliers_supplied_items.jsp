<%-- 
    Document   : view_suppliers_supplied_items
    Created on : Apr 28, 2020, 10:47:47 PM
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
        <jsp:useBean id="suppliedItemMgr" class="Beans.SuppliedItemMgr"/>
        <%suppliedItemMgr.retrieveSuppliedItemsBySupplier(Integer.parseInt(request.getParameter("supplierId")));%>
        
        <h1>${param.supplierName}'s Supplied Items</h1>

        <table border="1">
            <thead>
                <tr>
                    <th>
                        Name
                    </th>
                    <th>
                        Selling Price
                    </th>
                    <th>
                        Brand
                    </th>
                    <th>
                        Supplier Price
                    </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${suppliedItemMgr.suppliedItemList}" var="suppliedItem">
                    <tr>
                        <td>${suppliedItem.item.itemName}</td>
                        <td>${suppliedItem.item.itemPrice}</td>
                        <td>${suppliedItem.item.itemBrand.brandName}</td>
                        <td>${suppliedItem.supplierPrice}</td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 
    </body>
</html>
