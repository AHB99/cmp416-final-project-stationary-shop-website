/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import Servlets.GetMonthlyProfitGraphData;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.CachedRowSet;

/**
 *
 * @author azada
 */
public class MonthlyRevenueExpense {

    @Override
    public String toString() {
        return "MonthlyRevenueExpense{" + "dateOfAccount=" + dateOfAccount + ", accountValue=" + accountValue + '}';
    }

    public float getAccountValue() {
        return accountValue;
    }

    public void setAccountValue(float accountValue) {
        this.accountValue = accountValue;
    }

    public MonthlyRevenueExpense(LocalDate dateOfAccount, float accountValue) {
        this.dateOfAccount = dateOfAccount;
        this.accountValue = accountValue;
    }

    public LocalDate getDateOfAccount() {
        return dateOfAccount;
    }

    public void setDateOfAccount(LocalDate dateOfAccount) {
        this.dateOfAccount = dateOfAccount;
    }

    public MonthlyRevenueExpense() {
    }

    public static ArrayList<MonthlyRevenueExpense> getTotalMonthlyProfit(){
        ArrayList<MonthlyRevenueExpense> monthlyProfit = new ArrayList<>();
        String query = 
        "select rev.ryear as pyear, rev.rmonth as pyear, (coalesce(revenue, 0)-coalesce(expense,0)) as profit from \n" +
        "(select sum(i.price * ssi.QUANTITY) as revenue, year(ss.date_of_sale) as ryear, month(ss.date_of_sale) as rmonth from shop_sale ss, shop_sale_items ssi, item i where ss.SALE_ID = ssi.SALE_ID and ssi.item_id = i.item_id group by year(ss.date_of_sale), month(ss.date_of_sale) order by ryear, rmonth) as rev " +
        "left outer join " +
        "(select sum(i.price * spi.QUANTITY) as expense, year(sp.DATE_OF_PURCHASE) as eyear, month(sp.DATE_OF_PURCHASE) as emonth from stock_purchase sp, stock_purchase_items spi, item i where sp.PURCHASE_ID = spi.PURCHASE_ID and spi.item_id = i.item_id group by year(sp.DATE_OF_PURCHASE), month(sp.DATE_OF_PURCHASE) order by eyear, emonth) as exp " +
        "on rev.ryear = exp.eyear and rev.rmonth = exp.emonth " +
        "union " +
        "select exp.eyear as pyear, exp.emonth as pyear, (coalesce(revenue, 0)-coalesce(expense,0)) as profit from " +
        "(select sum(i.price * ssi.QUANTITY) as revenue, year(ss.date_of_sale) as ryear, month(ss.date_of_sale) as rmonth from shop_sale ss, shop_sale_items ssi, item i where ss.SALE_ID = ssi.SALE_ID and ssi.item_id = i.item_id group by year(ss.date_of_sale), month(ss.date_of_sale) order by ryear, rmonth) as rev " +
        "right outer join " +
        "(select sum(i.price * spi.QUANTITY) as expense, year(sp.DATE_OF_PURCHASE) as eyear, month(sp.DATE_OF_PURCHASE) as emonth from stock_purchase sp, stock_purchase_items spi, item i where sp.PURCHASE_ID = spi.PURCHASE_ID and spi.item_id = i.item_id group by year(sp.DATE_OF_PURCHASE), month(sp.DATE_OF_PURCHASE) order by eyear, emonth) as exp " +
        "on rev.ryear = exp.eyear and rev.rmonth = exp.emonth";
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand(query);
            crs.execute();
            while (crs.next()) {
                monthlyProfit.add(new MonthlyRevenueExpense(LocalDate.of(crs.getInt(1), crs.getInt(2), 1), crs.getFloat("profit")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MonthlyRevenueExpense.class.getName()).log(Level.SEVERE, null, ex);
        }
        return monthlyProfit;
    }

    public static ArrayList<MonthlyRevenueExpense> getTotalMonthlyProfitByShop(int shopId){
        ArrayList<MonthlyRevenueExpense> monthlyProfit = new ArrayList<>();
        String query = 
        "select rev.ryear as pyear, rev.rmonth as pyear, (coalesce(revenue, 0)-coalesce(expense,0)) as profit from \n" +
        "(select sum(i.price * ssi.QUANTITY) as revenue, year(ss.date_of_sale) as ryear, month(ss.date_of_sale) as rmonth from shop_sale ss, shop_sale_items ssi, item i where ss.shop_id = ? and ss.SALE_ID = ssi.SALE_ID and ssi.item_id = i.item_id group by year(ss.date_of_sale), month(ss.date_of_sale) order by ryear, rmonth) as rev " +
        "left outer join " +
        "(select sum(i.price * spi.QUANTITY) as expense, year(sp.DATE_OF_PURCHASE) as eyear, month(sp.DATE_OF_PURCHASE) as emonth from stock_purchase sp, stock_purchase_items spi, item i where sp.shop_id = ? and sp.PURCHASE_ID = spi.PURCHASE_ID and spi.item_id = i.item_id group by year(sp.DATE_OF_PURCHASE), month(sp.DATE_OF_PURCHASE) order by eyear, emonth) as exp " +
        "on rev.ryear = exp.eyear and rev.rmonth = exp.emonth " +
        "union " +
        "select exp.eyear as pyear, exp.emonth as pyear, (coalesce(revenue, 0)-coalesce(expense,0)) as profit from " +
        "(select sum(i.price * ssi.QUANTITY) as revenue, year(ss.date_of_sale) as ryear, month(ss.date_of_sale) as rmonth from shop_sale ss, shop_sale_items ssi, item i where ss.shop_id = ? and ss.SALE_ID = ssi.SALE_ID and ssi.item_id = i.item_id group by year(ss.date_of_sale), month(ss.date_of_sale) order by ryear, rmonth) as rev " +
        "right outer join " +
        "(select sum(i.price * spi.QUANTITY) as expense, year(sp.DATE_OF_PURCHASE) as eyear, month(sp.DATE_OF_PURCHASE) as emonth from stock_purchase sp, stock_purchase_items spi, item i where sp.shop_id = ? and sp.PURCHASE_ID = spi.PURCHASE_ID and spi.item_id = i.item_id group by year(sp.DATE_OF_PURCHASE), month(sp.DATE_OF_PURCHASE) order by eyear, emonth) as exp " +
        "on rev.ryear = exp.eyear and rev.rmonth = exp.emonth";
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand(query);
            crs.setInt(1,shopId);
            crs.setInt(2, shopId);
            crs.setInt(3, shopId);
            crs.setInt(4, shopId);

            crs.execute();
            while (crs.next()) {
                monthlyProfit.add(new MonthlyRevenueExpense(LocalDate.of(crs.getInt(1), crs.getInt(2), 1), crs.getFloat("profit")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MonthlyRevenueExpense.class.getName()).log(Level.SEVERE, null, ex);
        }
        return monthlyProfit;
    }
    
    private LocalDate dateOfAccount;
    private float accountValue;
}
