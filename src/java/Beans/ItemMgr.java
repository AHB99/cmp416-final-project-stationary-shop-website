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
public class ItemMgr {

    public ArrayList<Item> getItemList() {
        return itemList;
    }

    public void setItemList(ArrayList<Item> itemList) {
        this.itemList = itemList;
    }

    public ItemMgr() {
    }
    
    
    public void retrieveItems() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM ITEM i, brands b where i.brand = b.brand_id");
            crs.execute();
            while (crs.next()) {
                itemList.add(new Item(crs.getInt("item_id"),crs.getString("name"),
                crs.getFloat("price"),new Brand(crs.getInt("brand"),crs.getString("brand_name"))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void retrieveItemsByNamePartialPhrase(String namePartialPhrase) {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM ITEM i, brands b where i.brand = b.brand_id and lower(i.name) LIKE '%"+namePartialPhrase.toLowerCase()+"%'");
            crs.execute();
            while (crs.next()) {
                itemList.add(new Item(crs.getInt("item_id"), crs.getString("name"),
                        crs.getFloat("price"), new Brand(crs.getInt("brand"), crs.getString("brand_name"))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void retrieveItemsByPriceRange(float lower, float upper) {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM ITEM i, brands b where i.brand = b.brand_id and i.price between ? and ?");
            crs.setFloat(1, lower);
            crs.setFloat(2, upper);

            crs.execute();
            while (crs.next()) {
                itemList.add(new Item(crs.getInt("item_id"), crs.getString("name"),
                        crs.getFloat("price"), new Brand(crs.getInt("brand"), crs.getString("brand_name"))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public void retrieveItemsByShopSold(int shopId) {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("select * from sells s, item i, brands b where shop_id = ? and s.item_id = i.item_id and i.brand = b.brand_id");
            crs.setInt(1, shopId);
            crs.execute();
            while (crs.next()) {
                itemList.add(new Item(crs.getInt("item_id"), crs.getString("name"), crs.getFloat("price"), new Brand(crs.getInt("brand_id"), crs.getString("brand_name"))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemMgr.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
    public void retrieveItemsNotSuppliedBySupplier(int supplierId) {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("select * from item i, brands b where i.brand = b.brand_id and i.item_id not in (select item_id from supplies where supplier_id = ?)");
            crs.setInt(1, supplierId);
            crs.execute();
            while (crs.next()) {
                itemList.add(new Item(crs.getInt("item_id"), crs.getString("name"), crs.getFloat("price"), new Brand(crs.getInt("brand_id"), crs.getString("brand_name"))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemMgr.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
    public void retrieveItemsNotSoldByShop(int shopId) {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("select * from item i, brands b where i.brand = b.brand_id and i.item_id not in (select item_id from sells where shop_id = ?)");
            crs.setInt(1, shopId);
            crs.execute();
            while (crs.next()) {
                itemList.add(new Item(crs.getInt("item_id"), crs.getString("name"), crs.getFloat("price"), new Brand(crs.getInt("brand_id"), crs.getString("brand_name"))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void retrieveItemsNotInStockPurchaseBySupplier(int purchaseId, int supplierId) {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("select * from supplies s, item i, brands b where s.supplier_id = ? and s.item_id = i.item_id and i.brand = b.brand_id and i.item_id not in (select item_id from stock_purchase_items where purchase_id = ? and supplier_id = ?) and i.item_id in (select s.item_id from sells s, stock_purchase sp where sp.purchase_id = ? and sp.shop_id = s.shop_id)");
            crs.setInt(1, supplierId);
            crs.setInt(2, purchaseId);
            crs.setInt(3, supplierId);
            crs.setInt(4, purchaseId);
            crs.execute();
            while (crs.next()) {
                itemList.add(new Item(crs.getInt("item_id"), crs.getString("name"), crs.getFloat("price"), new Brand(crs.getInt("brand_id"), crs.getString("brand_name"))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void retrieveItemsNotInShopSale(int saleId) {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("select * from item i, brands b where i.brand = b.brand_id and i.item_id not in (select item_id from shop_sale_items where sale_id = ?) and i.item_id in (select s.item_id from sells s, shop_sale ss where ss.shop_id = s.shop_id and ss.sale_id = ?)");
            crs.setInt(1, saleId);
            crs.setInt(2, saleId);
            crs.execute();
            while (crs.next()) {
                itemList.add(new Item(crs.getInt("item_id"), crs.getString("name"), crs.getFloat("price"), new Brand(crs.getInt("brand_id"), crs.getString("brand_name"))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean isEmpty(){
        return itemList.isEmpty();
    }
    
    public void addItem(Item item){
        itemList.add(item);
    }
    
    private ArrayList<Item> itemList= new ArrayList<>();
    
}
