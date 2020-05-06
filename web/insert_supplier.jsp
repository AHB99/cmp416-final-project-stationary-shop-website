<%-- 
    Document   : insert_supplier
    Created on : Apr 28, 2020, 8:03:26 PM
    Author     : azada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Insert New Supplier</h1>
        <form action="insert_supplier_action.jsp">
            <fieldset>
                <legend>Enter Details</legend>
                <label for="supplier_name">Name: </label>
                <input type="text" id = "supplier_name" required name="supplierName" value="" /><br/>
                <label for="telephone">Telephone: </label>
                <input type="tel" id = "telephone" required name="telephone" value="" /><br/>
                <label for="email">Email ID: </label>
                <input type="email" id = "email" required name="email" value="" /><br/>
                <input type="submit" value="Insert" />
            </fieldset>
        </form>
    </body>
</html>
