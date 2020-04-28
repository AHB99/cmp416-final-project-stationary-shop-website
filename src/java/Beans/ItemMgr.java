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
            crs.setCommand("SELECT * FROM ITEM");
            crs.execute();
            while (crs.next()) {
                itemList.add(new Item(crs.getInt("item_id"),crs.getString("name"),
                crs.getFloat("price"),crs.getString("brand")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private ArrayList<Item> itemList= new ArrayList<>();
    
}
