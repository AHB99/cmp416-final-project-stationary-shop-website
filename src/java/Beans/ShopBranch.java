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
public class ShopBranch {

    @Override
    public String toString() {
        return "ShopBranch{" + "shopId=" + shopId + ", location=" + location + ", squareFootage=" + squareFootage + '}';
    }

    public ShopBranch(int shopId) {
        this.shopId = shopId;
    }

    public int getShopId() {
        return shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public float getSquareFootage() {
        return squareFootage;
    }

    public void setSquareFootage(float squareFootage) {
        this.squareFootage = squareFootage;
    }

    public ShopBranch(int shopId, String location, float squareFootage) {
        this.shopId = shopId;
        this.location = location;
        this.squareFootage = squareFootage;
    }

    public ShopBranch() {
    }
    
    public boolean insertShopBranch(){
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("INSERT INTO SHOP_BRANCH (LOCATION, SQUARE_FOOTAGE) VALUES (?,?)");
            crs.setString(1, location);
            crs.setFloat(2, squareFootage);
            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ShopBranch.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void retrieveShopBranch(){
        if (shopId == null) {
            return;
        }
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("select * from shop_branch where shop_id = ?");
            crs.setInt(1, shopId);
            crs.execute();
            if (crs.next()) {
                location = crs.getString("location");
                squareFootage = crs.getFloat("square_footage");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShopBranch.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private Integer shopId;
    private String location;
    private float squareFootage;
    
}
