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

            function onGraphButtonClicked() {
                var selectedShop = $("#shop_selection :selected").val();
                var param = {"selectedShop" : selectedShop};
                $.post("GetMonthlyProfitGraphData", param, dbRetrievalCallback);
            }

            function dbRetrievalCallback(fetched) {
                retrievedData = $.parseJSON(fetched);
                for (i = 0; i < retrievedData.length; ++i){
                    retrievedData[i][0] = new Date(retrievedData[i][0]);
                }
                drawChart(retrievedData);
            }

            function drawChart(retrievedData) {

                var data = new google.visualization.DataTable();
                data.addColumn('date', 'Month');
                data.addColumn('number', 'Profit');

                data.addRows(retrievedData);

                var options = {
                    chart: {
                        title: 'Monthly Profit of '+ $("#shop_selection :selected").text(),
                    },
                    width: 900,
                    height: 500,
                    vAxis: {title: 'Profit'},
                    legend: { position: 'none' },
                };

                var chart = new google.charts.Line(document.getElementById('monthly_profit_line'));

                chart.draw(data, google.charts.Line.convertOptions(options));
            }
        </script>
    </head>
    <body>
        <%@ include file="login_checker_gist" %>
        
        <jsp:useBean id="shopBranchMgr" class="Beans.ShopBranchMgr" />
        ${shopBranchMgr.retrieveShopBranches()}
        
        <h1>Monthly Profit Line Graph</h1>
        <br/>
        <fieldset>
            <legend>Select Shop to Graph:</legend>
            <label for="shop">Shop Branch: </label>
            <select id="shop_selection">
                <option value="full">Full Company</option>
                <c:forEach items="${shopBranchMgr.shopList}" var="shop">
                    <option value="${shop.shopId}">${shop.location}</option>
                </c:forEach>        
            </select>
            <input type="button" value="Graph" onclick="onGraphButtonClicked();"/><br/>            
        </fieldset>
        <br/>
        <div id="monthly_profit_line" style="width: 900px; height: 500px"></div>
        <br/>
        <form action="home.jsp" method="POST"><input type="submit" value="Back to Main Menu" /></form> 

    </body>
</html>
