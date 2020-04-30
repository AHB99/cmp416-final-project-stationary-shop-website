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

    public Integer getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(Integer purchaseId) {
        this.purchaseId = purchaseId;
    }

    public StockPurchase(Integer purchaseId, ShopBranch shopBranch, LocalDate purchaseDate) {
        this.purchaseId = purchaseId;
        this.shopBranch = shopBranch;
        this.purchaseDate = purchaseDate;
    }

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
    
    public void parsePurchaseDate(String purchaseDateString) {
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
    
    public void retrieveStockPurchase() {
        if (purchaseId == null) {
            return;
        }
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("select * from stock_purchase_items spi, supplies ss, supplier s, item i, brands b where spi.supplier_id = ss.supplier_id and ss.supplier_id = s.supplier_id and ss.item_id = spi.item_id and ss.item_id = i.item_id and i.brand = b.brand_id and spi.purchase_id = ?");
            crs.setInt(1, purchaseId);
            crs.execute();
            while (crs.next()){
                stockPurchaseItemMgr.addStockPurchaseItem(
                new StockPurchaseItem(new SuppliedItem(new Supplier(crs.getInt("supplier_id"),crs.getString("supplier_name"), crs.getString("supplier_telephone"), crs.getString("supplier_emailid")),
                new Item(crs.getInt("item_Id"), crs.getString("name"),crs.getFloat("price"),new Brand(crs.getInt("brand_id"), crs.getString("brand_name"))),crs.getFloat("supplier_price")), crs.getInt("quantity")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StockPurchase.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean deleteStockPurchase() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("delete from stock_purchase_items where purchase_id = ?");
            crs.setInt(1, purchaseId);
            crs.execute();
            crs.setCommand("delete from stock_purchase where purchase_id = ?");
            crs.setInt(1, purchaseId);
            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(StockPurchase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
    private Integer purchaseId;
    private ShopBranch shopBranch;
    private LocalDate purchaseDate;
    private StockPurchaseItemMgr stockPurchaseItemMgr = new StockPurchaseItemMgr();
}
