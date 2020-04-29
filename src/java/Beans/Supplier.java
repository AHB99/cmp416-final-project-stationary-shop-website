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
public class Supplier {

    public Supplier(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Supplier(Integer supplierId, String supplierName, String telephone, String email) {
        this.supplierId = supplierId;
        this.supplierName = supplierName;
        this.telephone = telephone;
        this.email = email;
    }

    public Supplier() {
    }
    
    
    public boolean insertSupplier() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("INSERT INTO SUPPLIER (SUPPLIER_NAME, SUPPLIER_TELEPHONE, SUPPLIER_EMAILID) VALUES (?,?,?)");
            crs.setString(1, supplierName);
            crs.setString(2, telephone);
            crs.setString(3, email);

            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Supplier.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean deleteSupplier() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("delete from supplier where supplier_id = ?");
            crs.setInt(1, supplierId);
            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Supplier.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    private Integer supplierId;
    private String supplierName;
    private String telephone;
    private String email;
}
