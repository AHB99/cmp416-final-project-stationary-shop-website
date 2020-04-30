/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author azada
 */
public class StockPurchase {

    @Override
    public String toString() {
        return "StockPurchase{" + "shopBranch=" + shopBranch + ", purchaseDate=" + purchaseDate + ", stockPurchaseItemMgr=" + stockPurchaseItemMgr + '}';
    }

    public StockPurchaseItemMgr getStockPurchaseItemMgr() {
        return stockPurchaseItemMgr;
    }

    public void setStockPurchaseItemMgr(StockPurchaseItemMgr stockPurchaseItemMgr) {
        this.stockPurchaseItemMgr = stockPurchaseItemMgr;
    }

    public StockPurchase(ShopBranch shopBranch, LocalDate purchaseDate, StockPurchaseItemMgr stockPurchaseItemMgr) {
        this.shopBranch = shopBranch;
        this.purchaseDate = purchaseDate;
        this.stockPurchaseItemMgr = stockPurchaseItemMgr;
    }

    public ShopBranch getShopBranch() {
        return shopBranch;
    }

    public void setShopBranch(ShopBranch shopBranch) {
        this.shopBranch = shopBranch;
    }

    public LocalDate getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(LocalDate purchaseDate) {
        this.purchaseDate = purchaseDate;
    }
    
    public void setPurchaseDate(String purchaseDateString) {
        this.purchaseDate = LocalDate.parse(purchaseDateString);
    }

    public StockPurchase() {
    }
    
    public void addStockPurchaseItem(StockPurchaseItem stockPurchaseItem){
        stockPurchaseItemMgr.addStockPurchaseItem(stockPurchaseItem);
    }

    private ShopBranch shopBranch;
    private LocalDate purchaseDate;
    private StockPurchaseItemMgr stockPurchaseItemMgr = new StockPurchaseItemMgr();
}
