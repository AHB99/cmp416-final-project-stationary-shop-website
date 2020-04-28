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
public class SellerItem {

    public ShopBranch getShopBranch() {
        return shopBranch;
    }

    public void setShopBranch(ShopBranch shopBranch) {
        this.shopBranch = shopBranch;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public SellerItem(ShopBranch shopBranch, Item item) {
        this.shopBranch = shopBranch;
        this.item = item;
    }

    public SellerItem() {
    }
    
    public boolean insertSellerItem() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("INSERT INTO SELLS (SHOP_ID, ITEM_ID) VALUES (?,?)");
            crs.setInt(1, shopBranch.getShopId());
            crs.setInt(2, item.getItemId());

            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SellerItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    private ShopBranch shopBranch;
    private Item item;
}
