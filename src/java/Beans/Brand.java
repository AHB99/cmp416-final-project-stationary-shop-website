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
public class Brand {

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public Brand(String brandName) {
        this.brandName = brandName;
    }

    public Brand() {
    }
    
    public boolean insertBrand() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("INSERT INTO BRANDS (BRAND) VALUES (?)");
            crs.setString(1, brandName);
            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Brand.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
    private String brandName;
    
}
