/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.CachedRowSet;

/**
 *
 * @author azada
 */
public class ShopSale {

    public ShopSaleItemMgr getShopSaleItems() {
        return shopSaleItems;
    }

    public void setShopSaleItems(ShopSaleItemMgr shopSaleItems) {
        this.shopSaleItems = shopSaleItems;
    }

    public ShopSale(Integer saleId, ShopBranch shopBranch, LocalDate saleDate) {
        this.saleId = saleId;
        this.shopBranch = shopBranch;
        this.saleDate = saleDate;
    }


    public Integer getSaleId() {
        return saleId;
    }

    public void setSaleId(Integer saleId) {
        this.saleId = saleId;
    }

    public ShopBranch getShopBranch() {
        return shopBranch;
    }

    public void setShopBranch(ShopBranch shopBranch) {
        this.shopBranch = shopBranch;
    }

    public LocalDate getSaleDate() {
        return saleDate;
    }
    
    public void setSaleDate(String saleDate) {
        this.saleDate = LocalDate.parse(saleDate);
    }
    
    public ShopSale() {
    }

    public void addShopSaleItem(ShopSaleItem item){
        shopSaleItems.addShopSaleItem(item);
    }
    
    public boolean insertShopSale() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("INSERT INTO shop_sale (shop_id, date_of_sale) VALUES (?,?)");
            crs.setInt(1, shopBranch.getShopId());
            crs.setDate(2, java.sql.Date.valueOf(saleDate));
            crs.execute();
            crs.setCommand("select max(sale_id) as curr_sale_id from shop_sale");
            crs.execute();
            crs.next();
            int currSaleId = crs.getInt("curr_sale_id");
            for (ShopSaleItem ssi : shopSaleItems.getShopSaleItemList()) {
                crs.setCommand("insert into shop_sale_items (sale_id, item_id, quantity) values(?,?,?)");
                crs.setInt(1, currSaleId);
                crs.setInt(2, ssi.getItem().getItemId());
                crs.setInt(3, ssi.getQuantity());
                crs.execute();
            }
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ShopSale.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    private Integer saleId;
    private ShopBranch shopBranch;
    private LocalDate saleDate;
    private ShopSaleItemMgr shopSaleItems = new ShopSaleItemMgr();
}
