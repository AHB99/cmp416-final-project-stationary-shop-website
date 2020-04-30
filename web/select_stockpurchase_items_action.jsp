<%-- 
    Document   : select_stockpurchase_items_action
    Created on : Apr 30, 2020, 8:57:29 PM
    Author     : azada
--%>

<%@page import="Beans.StockPurchaseItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <jsp:useBean id="currentStockPurchase" class="Beans.StockPurchase" scope="session"/>
        <jsp:useBean id="suppliedItemsForStockPurchase" class="Beans.SuppliedItemMgr" scope="session" />
        
        
        <%
            for (int i = 0; i < suppliedItemsForStockPurchase.getSuppliedItemList().size(); ++i){
                int itemQuantity = Integer.parseInt(request.getParameter("itemIndex:"+i));
                if (itemQuantity > 0){
                    StockPurchaseItem stPurchItemToAdd = 
                    new StockPurchaseItem(suppliedItemsForStockPurchase.getSuppliedItemList().get(i)
                    ,itemQuantity);
                    System.out.println("Adding STPI: " + stPurchItemToAdd);
                    currentStockPurchase.addStockPurchaseItem(stPurchItemToAdd);
                }
            }
        %>
        
        
        <jsp:forward page="review_stockpurchase.jsp" />
        
        
    </body>
</html>
