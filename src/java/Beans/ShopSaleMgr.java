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
public class ShopSaleMgr {

    public ArrayList<ShopSale> getShopSaleList() {
        return shopSaleList;
    }

    public void setShopSaleList(ArrayList<ShopSale> shopSaleList) {
        this.shopSaleList = shopSaleList;
    }

    public ShopSaleMgr() {
    }
    
    public void retrieveShopSales() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM shop_sale ss, shop_branch sb where ss.shop_id = sb.shop_id");
            crs.execute();
            while (crs.next()) {
                shopSaleList.add(new ShopSale(crs.getInt("sale_id"), new ShopBranch(crs.getInt("shop_id"), crs.getString("location"), crs.getFloat("square_footage")), crs.getDate("date_of_sale").toLocalDate()));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShopSaleMgr.class.getName()).log(Level.SEVERE, null, ex);
        } 
        
    }
    
    public void retrieveShopSalesByBranch(int shopId) {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM shop_sale ss, shop_branch sb where ss.shop_id = sb.shop_id and sb.shop_id = ?");
            crs.setInt(1, shopId);
            crs.execute();
            while (crs.next()) {
                shopSaleList.add(new ShopSale(crs.getInt("sale_id"), new ShopBranch(crs.getInt("shop_id"), crs.getString("location"), crs.getFloat("square_footage")), crs.getDate("date_of_sale").toLocalDate()));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShopSaleMgr.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    
    private ArrayList<ShopSale> shopSaleList = new ArrayList<>();
}
