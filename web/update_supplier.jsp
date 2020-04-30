<%-- 
    Document   : update_supplier
    Created on : Apr 29, 2020, 7:59:29 PM
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
        <jsp:useBean id="selectedSupplier" class="Beans.Supplier">
            <jsp:setProperty name="selectedSupplier" property="*"/>
        </jsp:useBean>
        ${selectedSupplier.retrieveSupplier()}
        
        <h1>Update Supplier</h1>
        <form action="update_supplier_action.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="supplier_name">Name: </label>
                <input type="text" id = "supplier_name" name="supplierName" value="${selectedSupplier.supplierName}" /><br/>
                <label for="telephone">Telephone: </label>
                <input type="tel" id = "telephone" name="telephone" value="${selectedSupplier.telephone}" /><br/>
                <label for="email">Email ID: </label>
                <input type="email" id = "email" name="email" value="${selectedSupplier.email}" /><br/>
                <input type="hidden" name="supplierId" value="${selectedSupplier.supplierId}" />
                <input type="submit" value="Update" />
            </fieldset>
        </form>
    </body>
</html>