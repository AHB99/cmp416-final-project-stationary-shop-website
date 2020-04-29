<%-- 
    Document   : view_brand
    Created on : Apr 28, 2020, 7:35:15 PM
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
        <h1>All Brands</h1>
        <jsp:useBean id="brandMgr" class="Beans.BrandMgr"/>
        ${brandMgr.retrieveBrands()}
        <table border="1">
            <thead>
                <tr>
                    <th>
                        Brand Name
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
                <c:forEach items="${brandMgr.brandList}" var="brand">
                    <tr>
                        <td>${brand.brandName}</td>
                        <form action="delete_brand_action.jsp">
                            <input type="hidden" name="brandId" value="${brand.brandId}"/>
                            <td><input type="submit" value="Delete" /></td>
                        </form>
                        <form action="update_brand.jsp">
                            <input type="hidden" name="brandId" value="${brand.brandId}"/>
                            <td><input type="submit" value="Update" /></td>
                        </form>
                    </tr>
                    
                </c:forEach>
            </tbody>
        </table>
        <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form>        
    </body>
    </body>
</html>
