<%-- 
    Document   : home
    Created on : Apr 22, 2020, 8:55:51 PM
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
        <h1>Main Menu</h1>
        <fieldset>
            <legend>Insert New Entry</legend>
            <form action="insert_entity_action.jsp">
                <select name="entity_choice">
                    <option value="department">Department</option>
                    <option value="shop_branch">Shop Branch</option>
                    <option value="employee">Employee</option>
                    <option value="brand">Brand</option>
                    <option value="item">Item</option>
                    <option value="supplier">Supplier</option>
                    <option value="stock_purchase">Stock Purchase</option>
                    <option value="shop_sale">Shop Sale</option>
                    <option value="supplied_item">Item for Supplier</option>
                    <option value="seller_item">Items for Shop</option>

                </select>
                <input type="submit" value="Insert" />
            </form>
        </fieldset>
        <fieldset>
            <legend>View/Update/Delete Data</legend>
            <form action="view_entity_action.jsp">
                <select name="entity_choice">
                    <option value="department">Department</option>
                    <option value="shop_branch">Shop Branch</option>
                    <option value="employee">Employee</option>
                    <option value="brand">Brand</option>
                    <option value="item">Item</option>
                    <option value="supplier">Supplier</option>
                    <option value="stock_purchase">Stock Purchase</option>
                    <option value="shop_sale">Shop Sale</option>

                </select>
                <input type="submit" value="View" />
            </form>            
        </fieldset>
        <fieldset>
            <legend>View Graphs: </legend>
            <form action="graph_menu_action.jsp">
                <select name="graph_choice">
                    <option value="employee_salary_hist">Employee Salary Histogram</option>
                </select>
                <input type="submit" value="Graph" />
            </form>            
        </fieldset>
    </body>
</html>
