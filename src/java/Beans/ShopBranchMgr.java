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
public class ShopBranchMgr {

    public ArrayList<ShopBranch> getShopList() {
        return shopList;
    }

    public void setShopList(ArrayList<ShopBranch> shopList) {
        this.shopList = shopList;
    }


    public ShopBranchMgr() {
    }
    
    public void retrieveShopBranches(){
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM SHOP_BRANCH");
            crs.execute();
            while (crs.next()) {
                shopList.add(new ShopBranch(crs.getInt("shop_id"), crs.getString("location"), crs.getFloat("square_footage")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShopBranchMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void retrieveShopBranchesByPartialPhrase(String locationPartialPhrase) {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM SHOP_BRANCH where lower(location) like '%"+locationPartialPhrase.toLowerCase()+"%'");
            crs.execute();
            while (crs.next()) {
                shopList.add(new ShopBranch(crs.getInt("shop_id"), crs.getString("location"), crs.getFloat("square_footage")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShopBranchMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private ArrayList<ShopBranch> shopList= new ArrayList<>();
    
}
