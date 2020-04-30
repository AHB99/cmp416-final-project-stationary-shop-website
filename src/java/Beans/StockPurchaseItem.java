/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

/**
 *
 * @author azada
 */
public class StockPurchaseItem {

    @Override
    public String toString() {
        return "StockPurchaseItem{" + "suppliedItem=" + suppliedItem + ", quantity=" + quantity + '}';
    }

    public SuppliedItem getSuppliedItem() {
        return suppliedItem;
    }

    public void setSuppliedItem(SuppliedItem suppliedItem) {
        this.suppliedItem = suppliedItem;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public StockPurchaseItem() {
    }

    public StockPurchaseItem(SuppliedItem suppliedItem, int quantity) {
        this.suppliedItem = suppliedItem;
        this.quantity = quantity;
    }
    
    
    private SuppliedItem suppliedItem;
    private int quantity;
}
