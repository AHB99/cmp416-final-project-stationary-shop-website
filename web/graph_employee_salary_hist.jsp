<%-- 
    Document   : graph_employee_salary_hist
    Created on : May 1, 2020, 8:27:01 PM
    Author     : azada
--%>

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
                $.post("GetEmployeeSalaryHistData", dbRetrievalCallback);
            }

            function dbRetrievalCallback(fetched) {
                retrievedData = $.parseJSON(fetched);
                drawChart(retrievedData);
            }

            function drawChart(retrievedData) {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Employee Name');
                data.addColumn('number', 'Salary');
                data.addRows(retrievedData);
                var options = {
                    legend: { position: 'none' },
                    hAxis: {title: 'Salary'},
                    vAxis: {title: 'Count'},
                    width: 900,
                    height: 500
                };

                var chart = new google.visualization.Histogram(document.getElementById('employee_salary_hist'));
                chart.draw(data, options);
            }
        </script>
    </head>
    <body>
        <h1>Employee Salary Histogram</h1>
        <br/>
        <div id="employee_salary_hist" style="width: 900px; height: 500px"></div>
    </body>
</html>