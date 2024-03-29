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
public class SuppliedItem {

    @Override
    public String toString() {
        return "SuppliedItem{" + "supplier=" + supplier + ", item=" + item + ", supplierPrice=" + supplierPrice + '}';
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public float getSupplierPrice() {
        return supplierPrice;
    }

    public void setSupplierPrice(float supplierPrice) {
        this.supplierPrice = supplierPrice;
    }

    public SuppliedItem(Supplier supplier, Item item, float supplierPrice) {
        this.supplier = supplier;
        this.item = item;
        this.supplierPrice = supplierPrice;
    }

    public SuppliedItem() {
    }
    
    public boolean insertSuppliedItem() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("INSERT INTO SUPPLIES (SUPPLIER_ID, ITEM_ID, SUPPLIER_PRICE) VALUES (?,?,?)");
            crs.setInt(1, supplier.getSupplierId());
            crs.setInt(2, item.getItemId());
            crs.setFloat(3, supplierPrice);

            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SuppliedItem.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return false;
    }
    
    public boolean deleteSuppliedItem() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("delete from supplies where supplier_id = ? and item_id = ?");
            crs.setInt(1, supplier.getSupplierId());
            crs.setInt(2, item.getItemId());

            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SuppliedItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void retrieveSuppliedItem() {
        if (supplier == null || item == null) {
            return;
        }
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("select * from supplies ss, item i, brands b, supplier s where s.supplier_id = ? and i.item_id = ? and ss.item_id = i.item_id and ss.supplier_id = s.supplier_id and i.brand = b.brand_id");
            crs.setInt(1, supplier.getSupplierId());
            crs.setInt(2, item.getItemId());

            crs.execute();
            if (crs.next()) {
                supplier = new Supplier(crs.getInt("supplier_id"), crs.getString("supplier_name"), crs.getString("supplier_telephone"), crs.getString("supplier_emailid"));
                item = new Item(crs.getInt("item_id"), crs.getString("name"), crs.getFloat("price"), new Brand(crs.getInt("brand")));
                supplierPrice = crs.getFloat("supplier_price");
            }
        } catch (SQLException ex) {
            Logger.getLogger(SuppliedItem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean updateSuppliedItem() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("update SUPPLIES set SUPPLIER_PRICE = ? where supplier_id = ? and item_id = ?");
            crs.setFloat(1, supplierPrice);
            crs.setInt(2, supplier.getSupplierId());
            crs.setInt(3, item.getItemId());

            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SuppliedItem.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
        
    private Supplier supplier;
    private Item item;
    private float supplierPrice;
}
