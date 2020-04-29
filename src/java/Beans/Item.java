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
public class Item {

    public Item(Integer itemId) {
        this.itemId = itemId;
    }

    public Brand getItemBrand() {
        return itemBrand;
    }

    public void setItemBrand(Brand itemBrand) {
        this.itemBrand = itemBrand;
    }

    public Item(Integer itemId, String itemName, float itemPrice, Brand itemBrand) {
        this.itemId = itemId;
        this.itemName = itemName;
        this.itemPrice = itemPrice;
        this.itemBrand = itemBrand;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public float getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(float itemPrice) {
        this.itemPrice = itemPrice;
    }



    public Item() {
    }
    
    public boolean insertItem() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("INSERT INTO ITEM (NAME, PRICE, BRAND) VALUES (?,?,?)");
            crs.setString(1, itemName);
            crs.setFloat(2, itemPrice);
            crs.setInt(3, itemBrand.getBrandId());

            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Item.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean deleteItem() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("delete from item where item_id = ?");
            crs.setInt(1, itemId);
            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Item.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return false;
    }
    
    private Integer itemId;
    private String itemName;
    private float itemPrice;
    private Brand itemBrand;
}
