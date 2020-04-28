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
public class BrandMgr {

    public ArrayList<Brand> getBrandList() {
        return brandList;
    }

    public void setBrandList(ArrayList<Brand> brandList) {
        this.brandList = brandList;
    }

    public BrandMgr() {
    }
    
    public void retrieveBrands() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM BRANDS");
            crs.execute();
            while (crs.next()) {
                brandList.add(new Brand(crs.getInt("brand_id"), crs.getString("brand_name")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrandMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    private ArrayList<Brand> brandList = new ArrayList<>();

}
