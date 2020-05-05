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
public class ShopSaleItem {

    public Integer getSaleId() {
        return saleId;
    }

    public void setSaleId(Integer saleId) {
        this.saleId = saleId;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public ShopSaleItem(Integer saleId, Item item, int quantity) {
        this.saleId = saleId;
        this.item = item;
        this.quantity = quantity;
    }

    public boolean deleteShopSaleItem() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("delete from shop_sale_items where sale_id = ? and item_id = ?");
            crs.setInt(1, saleId);
            crs.setInt(2, item.getItemId());
            crs.execute();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ShopSaleItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void retrieveShopSaleItem() {
        if (saleId == null || item.getItemId() == null) {
            return;
        }
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM shop_sale_items where sale_id = ? and item_id = ?");
            crs.setInt(1, saleId);
            crs.setInt(2, item.getItemId());
            crs.execute();
            if (crs.next()) {
                quantity = crs.getInt("quantity");
            }
            item.retrieveItem();
        } catch (SQLException ex) {
            Logger.getLogger(ShopSaleItem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean updateShopSaleItem() {
        try {
            if (quantity <= 0) {
                deleteShopSaleItem();
            } else {
                CachedRowSet crs = DbCredentials.getConfiguredConnection();
                crs.setCommand("update shop_sale_items set quantity = ? where sale_id = ? and item_id = ?");
                crs.setInt(1, quantity);
                crs.setInt(2, saleId);
                crs.setInt(3, item.getItemId());
                crs.execute();
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ShopSaleItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean insertShopSaleItem() {
        try {

            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("insert into shop_sale_items (sale_id, item_id, quantity) values (?,?,?)");
            crs.setInt(1, saleId);
            crs.setInt(2, item.getItemId());
            crs.setInt(3, quantity);
            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ShopSaleItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ShopSaleItem() {
        
    }
    private Integer saleId;
    private Item item;
    private int quantity;
}
