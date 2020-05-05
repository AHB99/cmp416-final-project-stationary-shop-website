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
public class Item {

    @Override
    public String toString() {
        return "Item{" + "itemId=" + itemId + ", itemName=" + itemName + ", itemPrice=" + itemPrice + ", itemBrand=" + itemBrand + '}';
    }

    public Item(Integer itemId) {
        this.itemId = itemId;
    }

    public Brand getItemBrand() {
        return itemBrand;
    }

    public void setItemBrand(Brand itemBrand) {
        this.itemBrand = itemBrand;
    }

    public Item(Integer itemId, String itemName, float itemPrice, Brand itemBrand) {
        this.itemId = itemId;
        this.itemName = itemName;
        this.itemPrice = itemPrice;
        this.itemBrand = itemBrand;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public float getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(float itemPrice) {
        this.itemPrice = itemPrice;
    }

    public Item() {
    }

    public boolean insertItem() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("INSERT INTO ITEM (NAME, PRICE, BRAND) VALUES (?,?,?)");
            crs.setString(1, itemName);
            crs.setFloat(2, itemPrice);
            crs.setInt(3, itemBrand.getBrandId());

            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Item.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteItem() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("delete from item where item_id = ?");
            crs.setInt(1, itemId);
            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Item.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void retrieveItem() {
        if (itemId == null) {
            return;
        }
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM ITEM i, brands b where i.brand = b.brand_id and i.item_id = ?");
            crs.setInt(1, itemId);
            crs.execute();
            if (crs.next()) {
                itemName = crs.getString("name");
                itemPrice = crs.getFloat("price");
                itemBrand = new Brand(crs.getInt("brand"), crs.getString("brand_name"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Item.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean updateItem() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("update ITEM set NAME = ?, PRICE = ?, BRAND = ? where item_id = ?");
            crs.setString(1, itemName);
            crs.setFloat(2, itemPrice);
            crs.setInt(3, itemBrand.getBrandId());
            crs.setInt(4, itemId);
            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Item.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int getStockAtShop(int shopId) {
        String q1 = "select t1.shop_id, t1.item_id, (coalesce(supplied_quantity,0)-coalesce(sold_quantity,0)) as stock from "
                + "(select shop_id, item_id, sum(quantity) as supplied_quantity from stock_purchase sp, stock_purchase_items spi "
                + "where sp.PURCHASE_ID = spi.PURCHASE_ID and shop_id = ? and item_id = ? group by shop_id, item_id) as t1 left outer join "
                + "(select shop_id, item_id, sum(quantity) as sold_quantity from shop_sale ss, shop_sale_items ssi "
                + "where ss.SALE_ID = ssi.SALE_ID and shop_id = ? and item_id = ?  group by shop_id, item_id) as t2 "
                + "on t1.shop_id = t2.shop_id and t1.item_id = t2.item_id";
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand(q1);
            crs.setInt(1, shopId);
            crs.setInt(2, itemId);
            crs.setInt(3, shopId);
            crs.setInt(4, itemId);

            crs.execute();
            if (crs.next()) {
                return crs.getInt("stock");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Item.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    private Integer itemId;
    private String itemName;
    private float itemPrice;
    private Brand itemBrand;
}
