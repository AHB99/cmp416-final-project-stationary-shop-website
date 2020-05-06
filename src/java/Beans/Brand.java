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

    public Brand(Integer brandId) {
        this.brandId = brandId;
    }

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public Brand(Integer brandId, String brandName) {
        this.brandId = brandId;
        this.brandName = brandName;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }


    public Brand() {
    }
    
    public boolean insertBrand() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("INSERT INTO BRANDS (brand_name) VALUES (?)");
            crs.setString(1, brandName);
            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Brand.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean deleteBrand() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("delete from brands where brand_id = ?");
            crs.setInt(1, brandId);
            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Brand.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void retrieveBrand() {
        if (brandId == null) {
            return;
        }
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM BRANDS where brand_id = ?");
            crs.setInt(1, brandId);
            crs.execute();
            while (crs.next()) {
                brandName = crs.getString("brand_name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Brand.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
    public boolean updateBrand() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("UPDATE BRANDS set brand_name = ? where brand_id = ?");
            crs.setString(1, brandName);
            crs.setInt(2, brandId);

            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Brand.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public int getItemCount(){
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT count(*) as item_count FROM item where brand = ? group by brand");
            crs.setInt(1, brandId);
            crs.execute();
            if (crs.next()) {
                return crs.getInt("item_count");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Brand.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    private Integer brandId;
    private String brandName;
    
}
