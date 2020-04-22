<%-- 
    Document   : db_credential_loader
    Created on : Apr 22, 2020, 6:32:24 PM
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
        <%
            Beans.DbCredentials.setDbname(getServletContext().getInitParameter("dbname"));
            Beans.DbCredentials.setDbuser(getServletContext().getInitParameter("dbuser"));
            Beans.DbCredentials.setDbpass(getServletContext().getInitParameter("dbpass"));
        %>
        <jsp:forward page="login.jsp" />
    </body>
</html>
