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
public class ShopSaleItem {

    public Integer getSaleId() {
        return saleId;
    }

    public void setSaleId(Integer saleId) {
        this.saleId = saleId;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public ShopSaleItem(Integer saleId, Item item, int quantity) {
        this.saleId = saleId;
        this.item = item;
        this.quantity = quantity;
    }

    public ShopSaleItem() {
    }
    private Integer saleId;
    private Item item;
    private int quantity;
}
