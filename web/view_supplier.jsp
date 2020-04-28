<%-- 
    Document   : view_supplier
    Created on : Apr 28, 2020, 8:06:38 PM
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
        <h1>All Suppliers</h1>
        <jsp:useBean id="supplierMgr" class="Beans.SupplierMgr"/>
        ${supplierMgr.retrieveSuppliers()}
        <table border="1">
            <thead>
                <tr>
                    <th>
                        Name
                    </th>
                    <th>
                        Telephone
                    </th>
                    <th>
                        Email ID
                    </th>
                    <th>
                        Items Supplied
                    </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${supplierMgr.supplierList}" var="supplier">
                    <tr>
                        <td>${supplier.supplierName}</td>
                        <td>${supplier.telephone}</td>
                        <td>${supplier.email}</td>
                        <form action="view_suppliers_supplied_items.jsp">
                            <input type="hidden" name="supplierId" value="${supplier.supplierId}"/>
                            <input type="hidden" name="supplierName" value="${supplier.supplierName}"/>
                            <td><input type="submit" value="View Supplied Item Info" /></td>
                        </form>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 
    </body>
</html>
