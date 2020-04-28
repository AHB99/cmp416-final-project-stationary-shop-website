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
public class SupplierMgr {

    public ArrayList<Supplier> getSupplierList() {
        return supplierList;
    }

    public void setSupplierList(ArrayList<Supplier> supplierList) {
        this.supplierList = supplierList;
    }

    public SupplierMgr() {
    }
    
    public void retrieveSuppliers() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM SUPPLIER");
            crs.execute();
            while (crs.next()) {
                supplierList.add(new Supplier(crs.getInt("supplier_id"), crs.getString("supplier_name"),
                        crs.getString("supplier_telephone"), crs.getString("supplier_emailid")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SupplierMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private ArrayList<Supplier> supplierList = new ArrayList<>();
}
