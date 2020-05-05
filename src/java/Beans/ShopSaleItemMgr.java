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
public class ShopSaleItemMgr {

    public ArrayList<ShopSaleItem> getShopSaleItemList() {
        return shopSaleItemList;
    }

    public void setShopSaleItemList(ArrayList<ShopSaleItem> shopSaleItemList) {
        this.shopSaleItemList = shopSaleItemList;
    }

    public ShopSaleItemMgr() {
    }
    
    public void addShopSaleItem(ShopSaleItem shopSaleItem){
        shopSaleItemList.add(shopSaleItem);
    }
    
    
    private ArrayList<ShopSaleItem> shopSaleItemList = new ArrayList<>();
}
