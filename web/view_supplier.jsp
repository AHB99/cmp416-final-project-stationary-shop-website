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
        
        <fieldset>
            <legend>Filter By:</legend>
            <form action="view_supplier.jsp">
                <label for="name_partial">Name (Partial Phrase): </label>
                <input type="text" id="name_partial" required name="namePartialPhrase" value=""/>
                <input type="hidden" name="filter_by" value="name_partial_phrase_fil"/>
                <input type="submit" value="Filter by Name" /><br/>
            </form>
            <form action="view_supplier.jsp">
                <input type="hidden" name="filter_by" value=""/>
                <input type="submit" value="Clear Filters" /><br/>
            </form>
        </fieldset>
        <br/>
        <c:choose>
            <c:when test="${param.filter_by.equals('name_partial_phrase_fil')}">
                ${supplierMgr.retrieveSuppliersByPartialPhrase(param.namePartialPhrase)}
            </c:when>
            <c:otherwise>
        ${supplierMgr.retrieveSuppliers()}
            </c:otherwise>
        </c:choose>
        
        
        
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
                    <th>
                        Delete
                    </th>
                    <th>
                        Update
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
                        <form action="delete_supplier_action.jsp">
                            <input type="hidden" name="supplierId" value="${supplier.supplierId}"/>
                            <td><input type="submit" value="Delete" /></td>
                        </form>
                        <form action="update_supplier.jsp">
                            <input type="hidden" name="supplierId" value="${supplier.supplierId}"/>
                            <td><input type="submit" value="Update" /></td>
                        </form>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 
    </body>
</html>
