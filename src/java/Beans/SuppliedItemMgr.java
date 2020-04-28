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
public class SuppliedItemMgr {

    public ArrayList<SuppliedItem> getSuppliedItemList() {
        return suppliedItemList;
    }

    public void setSuppliedItemList(ArrayList<SuppliedItem> suppliedItemList) {
        this.suppliedItemList = suppliedItemList;
    }


    public SuppliedItemMgr() {
    }
    
    public void retrieveSuppliedItems() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("select * from supplies");
            crs.execute();
            while (crs.next()) {
                suppliedItemList.add(new SuppliedItem(new Supplier(crs.getInt("supplier_id")), 
                        new Item(crs.getInt("item_id")),
                        crs.getFloat("supplier_price")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SuppliedItemMgr.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
    public void retrieveSuppliedItemsBySupplier(int supplierId) {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("select * from supplies s, item i, brands b where supplier_id = ? and s.item_id = i.item_id and i.brand = b.brand_id");
            crs.setInt(1,supplierId);
            crs.execute();
            while (crs.next()) {
                suppliedItemList.add(new SuppliedItem(new Supplier(crs.getInt("supplier_id")),
                        new Item(crs.getInt("item_id"),crs.getString("name"),crs.getFloat("price"),
                        new Brand(crs.getInt("brand_id"), crs.getString("brand_name"))),
                        crs.getFloat("supplier_price")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SuppliedItemMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private ArrayList<SuppliedItem> suppliedItemList = new ArrayList<>();

}
