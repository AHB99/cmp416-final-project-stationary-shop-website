<%-- 
    Document   : graph_monthly_profit_line
    Created on : May 2, 2020, 1:09:09 AM
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
            google.charts.load('current', {'packages': ['line']});
            google.charts.setOnLoadCallback(getDataFromDb);

            function getDataFromDb() {
                $.post("GetMonthlyProfitGraphData", dbRetrievalCallback);
            }

            function dbRetrievalCallback(fetched) {
                retrievedData = $.parseJSON(fetched);
                drawChart(retrievedData);
            }

            function drawChart(retrievedData) {

                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Month');
                data.addColumn('number', 'Profit');

                data.addRows(retrievedData);

                var options = {
                    chart: {
                        title: 'Monthly Profit',
                    },
                    width: 900,
                    height: 500
                };

                var chart = new google.charts.Line(document.getElementById('monthly_profit_line'));

                chart.draw(data, google.charts.Line.convertOptions(options));
            }
        </script>
    </head>
    <body>
        <%@ include file="login_checker_gist" %>

        <h1>Monthly Profit Line Graph</h1>
        <br/>
        <div id="monthly_profit_line" style="width: 900px; height: 500px"></div>
        <br/>
        <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 

    </body>
</html>
