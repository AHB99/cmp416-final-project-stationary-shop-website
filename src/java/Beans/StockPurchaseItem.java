/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.CachedRowSet;

/**
 *
 * @author azada
 */
public class StockPurchaseItem {

    @Override
    public String toString() {
        return "StockPurchaseItem{" + "purchaseId=" + purchaseId + ", suppliedItem=" + suppliedItem + ", quantity=" + quantity + '}';
    }

    public int getPurchaseId() {
        return purchaseId;
    }

    public void setPurchaseId(int purchaseId) {
        this.purchaseId = purchaseId;
    }

    public SuppliedItem getSuppliedItem() {
        return suppliedItem;
    }

    public void setSuppliedItem(SuppliedItem suppliedItem) {
        this.suppliedItem = suppliedItem;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public StockPurchaseItem() {
    }

    public StockPurchaseItem(SuppliedItem suppliedItem, int quantity) {
        this.suppliedItem = suppliedItem;
        this.quantity = quantity;
    }

    public StockPurchaseItem(SuppliedItem suppliedItem, int quantity, int purchaseId) {
        this.suppliedItem = suppliedItem;
        this.quantity = quantity;
        this.purchaseId = purchaseId;
    }

    public boolean deleteStockPurchaseItem() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("delete from stock_purchase_items where purchase_id = ? and supplier_id = ? and item_id = ?");
            crs.setInt(1, purchaseId);
            crs.setInt(2, suppliedItem.getSupplier().getSupplierId());
            crs.setInt(3, suppliedItem.getItem().getItemId());

            crs.execute();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(StockPurchaseItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void retrieveStockPurchaseItem() {
        if (purchaseId == null || suppliedItem.getSupplier().getSupplierId() == null || suppliedItem.getItem().getItemId() == null) {
            return;
        }
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM stock_purchase_items where purchase_id = ? and supplier_id = ? and item_id = ?");
            crs.setInt(1, purchaseId);
            crs.setInt(2, suppliedItem.getSupplier().getSupplierId());
            crs.setInt(3, suppliedItem.getItem().getItemId());
            crs.execute();
            if (crs.next()) {
                quantity = crs.getInt("quantity");
            }
            suppliedItem.retrieveSuppliedItem();
        } catch (SQLException ex) {
            Logger.getLogger(StockPurchaseItem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean updateStockPurchaseItem() {
        try {
            if (quantity <= 0) {
                deleteStockPurchaseItem();
            } else {
                CachedRowSet crs = DbCredentials.getConfiguredConnection();
                crs.setCommand("update stock_purchase_items set quantity = ? where purchase_id = ? and supplier_id = ? and item_id = ?");
                crs.setInt(1, quantity);
                crs.setInt(2, purchaseId);
                crs.setInt(3, suppliedItem.getSupplier().getSupplierId());
                crs.setInt(4, suppliedItem.getItem().getItemId());
                crs.execute();
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(StockPurchaseItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean insertStockPurchaseItem() {
        try {

            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("insert into stock_purchase_items (purchase_id, supplier_id, item_id, quantity) values(?,?,?,?)");
            crs.setInt(1, purchaseId);
            crs.setInt(2, suppliedItem.getSupplier().getSupplierId());
            crs.setInt(3, suppliedItem.getItem().getItemId());
            crs.setInt(4, quantity);
            crs.execute();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(StockPurchaseItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    private Integer purchaseId;
    private SuppliedItem suppliedItem;
    private int quantity;
}
