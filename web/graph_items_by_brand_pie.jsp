<%-- 
    Document   : graph_items_by_brand_pie
    Created on : May 6, 2020, 4:36:36 PM
    Author     : azada
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript" src="jquery_lib/jquery-3.5.0.min.js"></script>
        <script type="text/javascript">
            google.charts.load("current", {packages: ["corechart"]});
            google.charts.setOnLoadCallback(getDataFromDb);

            function getDataFromDb() {
                $.post("GetItemByBrandGraphData", dbRetrievalCallback);
            }

            function dbRetrievalCallback(fetched) {
                retrievedData = $.parseJSON(fetched);
                drawChart(retrievedData);
            }



            function drawChart() {

                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Brand');
                data.addColumn('number', 'Items');
                data.addRows(retrievedData);

                var options = {
                    is3D: true,

                    width: 900,
                    height: 500
                };

                var chart = new google.visualization.PieChart(document.getElementById('item_brand_pie'));
                chart.draw(data, options);
            }
        </script>
    </head>
    <body>
        <%@ include file="login_checker_gist" %>
        <h1>Items By Brand Pie Chart</h1>
        <br/>
        <div id="item_brand_pie" style="width: 900px; height: 500px"></div>
        <br/>
        <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 

    </body>
</html>
