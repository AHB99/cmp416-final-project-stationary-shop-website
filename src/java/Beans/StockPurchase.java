/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.CachedRowSet;

/**
 *
 * @author azada
 */
public class StockPurchase {

    @Override
    public String toString() {
        return "StockPurchase{" + "shopBranch=" + shopBranch + ", purchaseDate=" + purchaseDate + ", stockPurchaseItemMgr=" + stockPurchaseItemMgr + '}';
    }

    public StockPurchaseItemMgr getStockPurchaseItemMgr() {
        return stockPurchaseItemMgr;
    }

    public void setStockPurchaseItemMgr(StockPurchaseItemMgr stockPurchaseItemMgr) {
        this.stockPurchaseItemMgr = stockPurchaseItemMgr;
    }

    public StockPurchase(ShopBranch shopBranch, LocalDate purchaseDate, StockPurchaseItemMgr stockPurchaseItemMgr) {
        this.shopBranch = shopBranch;
        this.purchaseDate = purchaseDate;
        this.stockPurchaseItemMgr = stockPurchaseItemMgr;
    }

    public ShopBranch getShopBranch() {
        return shopBranch;
    }

    public void setShopBranch(ShopBranch shopBranch) {
        this.shopBranch = shopBranch;
    }

    public LocalDate getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(LocalDate purchaseDate) {
        this.purchaseDate = purchaseDate;
    }
    
    public void setPurchaseDate(String purchaseDateString) {
        this.purchaseDate = LocalDate.parse(purchaseDateString);
    }

    public StockPurchase() {
    }
    
    public void addStockPurchaseItem(StockPurchaseItem stockPurchaseItem){
        stockPurchaseItemMgr.addStockPurchaseItem(stockPurchaseItem);
    }
    
    public boolean insertStockPurchase() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("INSERT INTO stock_purchase (shop_id, date_of_purchase) VALUES (?,?)");
            crs.setInt(1, shopBranch.getShopId());
            crs.setDate(2, java.sql.Date.valueOf(purchaseDate));
            crs.execute();
            crs.setCommand("select max(purchase_id) as curr_purchase_id from stock_purchase");
            crs.execute();
            crs.next();
            int currPurchaseId = crs.getInt("curr_purchase_id");
            for (StockPurchaseItem spi : stockPurchaseItemMgr.getStPurItemList()){
                crs.setCommand("insert into stock_purchase_items (purchase_id, supplier_id, item_id, quantity) values(?,?,?,?)");
                crs.setInt(1, currPurchaseId);
                crs.setInt(2, spi.getSuppliedItem().getSupplier().getSupplierId());
                crs.setInt(3, spi.getSuppliedItem().getItem().getItemId());
                crs.setInt(4, spi.getQuantity());
                crs.execute();
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(StockPurchase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    private ShopBranch shopBranch;
    private LocalDate purchaseDate;
    private StockPurchaseItemMgr stockPurchaseItemMgr = new StockPurchaseItemMgr();
}
