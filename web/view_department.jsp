<%-- 
    Document   : view_department
    Created on : Apr 26, 2020, 12:25:51 AM
    Author     : azada
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Departments</title>
    </head>
    <body>
        <%@ include file="login_checker_gist" %>

        <h1>All Departments</h1>
        <jsp:useBean id="departmentMgr" class="Beans.DepartmentMgr"/>
        <fieldset>
            <legend>Filter By:</legend>
            <form action="view_department.jsp">
                <label for="name_partial">Name (Partial Phrase): </label>
                <input type="text" id="name_partial" required name="namePartialPhrase" value=""/>
                <input type="hidden" name="filter_by" value="name_partial_phrase_fil"/>
                <input type="submit" value="Filter by Name" /><br/>
            </form>
            <form action="view_department.jsp">
                <input type="hidden" name="filter_by" value=""/>
                <input type="submit" value="Clear Filters" /><br/>
            </form>
        </fieldset>
        <br/>
        <c:choose>
            <c:when test="${param.filter_by.equals('name_partial_phrase_fil')}">
                ${departmentMgr.retrieveDepartmentsByPartialPhrase(param.namePartialPhrase)}
            </c:when>
            <c:otherwise>
                ${departmentMgr.retrieveDepartments()}
            </c:otherwise>
        </c:choose>



        <table border="1">
            <thead>
                <tr>
                    <th>
                        Department Name
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
                <c:forEach items="${departmentMgr.departmentList}" var="dep">
                    <tr>
                        <td>${dep.departmentName}</td>
                <form action="delete_department_action.jsp">
                    <input type="hidden" name="departmentId" value="${dep.departmentId}"/>
                    <td><input type="submit" value="Delete" /></td>
                </form>
                <form action="update_department.jsp">
                    <input type="hidden" name="departmentId" value="${dep.departmentId}"/>
                    <td><input type="submit" value="Update" /></td>
                </form>
            </tr>                 
        </c:forEach>
    </tbody>
</table>
<form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form>        
</body>
</html>
