/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.CachedRowSet;

/**
 *
 * @author azada
 */
public class StockPurchaseMgr {

    public ArrayList<StockPurchase> getStockPurchaseList() {
        return stockPurchaseList;
    }

    public void setStockPurchaseList(ArrayList<StockPurchase> stockPurchaseList) {
        this.stockPurchaseList = stockPurchaseList;
    }

    public StockPurchaseMgr() {
    }
    
    public void retrieveStockPurchases() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM stock_purchase sp, shop_branch sb where sp.shop_id = sb.shop_id");
            crs.execute();
            while (crs.next()) {
                stockPurchaseList.add(new StockPurchase(crs.getInt("purchase_id"), new ShopBranch(crs.getInt("shop_id"), crs.getString("location"), crs.getFloat("square_footage")), crs.getDate("date_of_purchase").toLocalDate()));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StockPurchaseMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void retrieveStockPurchasesByBranch(int shopId) {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM stock_purchase sp, shop_branch sb where sp.shop_id = sb.shop_id and sb.shop_id = ?");
            crs.setInt(1, shopId);
            crs.execute();
            while (crs.next()) {
                stockPurchaseList.add(new StockPurchase(crs.getInt("purchase_id"), new ShopBranch(crs.getInt("shop_id"), crs.getString("location"), crs.getFloat("square_footage")), crs.getDate("date_of_purchase").toLocalDate()));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StockPurchaseMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private ArrayList<StockPurchase> stockPurchaseList = new ArrayList<>();
}
