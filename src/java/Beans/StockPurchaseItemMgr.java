/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.util.ArrayList;

/**
 *
 * @author azada
 */
public class StockPurchaseItemMgr {

    @Override
    public String toString() {
        return "StockPurchaseItemMgr{" + "stPurItemList=" + stPurItemList + '}';
    }

    public StockPurchaseItemMgr() {
    }

    public ArrayList<StockPurchaseItem> getStPurItemList() {
        return stPurItemList;
    }

    public void setStPurItemList(ArrayList<StockPurchaseItem> stPurItemList) {
        this.stPurItemList = stPurItemList;
    }
    
    public void addStockPurchaseItem(StockPurchaseItem stockPurchaseItem){
        stPurItemList.add(stockPurchaseItem);
    }
    
    private ArrayList<StockPurchaseItem> stPurItemList = new ArrayList<>();
}
