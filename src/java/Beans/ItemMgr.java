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
public class ItemMgr {

    public ArrayList<Item> getItemList() {
        return itemList;
    }

    public void setItemList(ArrayList<Item> itemList) {
        this.itemList = itemList;
    }

    public ItemMgr() {
    }
    
    
    public void retrieveItems() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM ITEM i, brands b where i.brand = b.brand_id");
            crs.execute();
            while (crs.next()) {
                itemList.add(new Item(crs.getInt("item_id"),crs.getString("name"),
                crs.getFloat("price"),new Brand(crs.getInt("brand"),crs.getString("brand_name"))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void retrieveItemsByShopSold(int shopId) {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("select * from sells s, item i, brands b where shop_id = ? and s.item_id = i.item_id and i.brand = b.brand_id");
            crs.setInt(1, shopId);
            crs.execute();
            while (crs.next()) {
                itemList.add(new Item(crs.getInt("item_id"), crs.getString("name"), crs.getFloat("price"), new Brand(crs.getInt("brand_id"), crs.getString("brand_name"))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemMgr.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
    private ArrayList<Item> itemList= new ArrayList<>();
    
}
