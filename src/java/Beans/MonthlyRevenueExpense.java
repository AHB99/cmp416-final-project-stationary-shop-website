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

    public static ArrayList<MonthlyRevenueExpense> getFullMonthlyProfit() {
        ArrayList<MonthlyRevenueExpense> monthlyProfit = new ArrayList<>();
        try {
            String q3 = "select min(dt) as min_date, max(dt) as max_date from (select date_of_sale as dt from shop_sale union select date_of_purchase as dt from stock_purchase) as t1";
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand(q3);
            crs.execute();
            LocalDate minDate = null, maxDate = null;

            if (crs.next()) {
                minDate = crs.getDate("min_date").toLocalDate();
                maxDate = crs.getDate("max_date").toLocalDate();
            }



            //These are ordered ascendingly, with day of month = 1
            ArrayList<MonthlyRevenueExpense> monthlyRevenue = getPaddedRevExpInRange(minDate, maxDate, getMonthlyRevenue());
            ArrayList<MonthlyRevenueExpense> monthlyExpense = getPaddedRevExpInRange(minDate, maxDate, getMonthlyExpense());

            for (int i = 0; i < monthlyExpense.size(); ++i){
                monthlyProfit.add(new MonthlyRevenueExpense(monthlyExpense.get(i).getDateOfAccount(), monthlyRevenue.get(i).getAccountValue() - monthlyExpense.get(i).getAccountValue()));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(MonthlyRevenueExpense.class.getName()).log(Level.SEVERE, null, ex);
        }

        return monthlyProfit;
    }

    private static ArrayList<MonthlyRevenueExpense> getMonthlyRevenue() {
        ArrayList<MonthlyRevenueExpense> monthlyRevenue = new ArrayList<>();
        String q1 = "select sum(i.price * ssi.QUANTITY) as revenue, year(ss.date_of_sale) as ryear, month(ss.date_of_sale) as rmonth from shop_sale ss, shop_sale_items ssi, item i where ss.SALE_ID = ssi.SALE_ID and ssi.item_id = i.item_id group by year(ss.date_of_sale), month(ss.date_of_sale) order by ryear, rmonth";

        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand(q1);
            crs.execute();
            while (crs.next()) {
                monthlyRevenue.add(new MonthlyRevenueExpense(LocalDate.of(crs.getInt("ryear"), crs.getInt("rmonth"), 1), crs.getFloat("revenue")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MonthlyRevenueExpense.class.getName()).log(Level.SEVERE, null, ex);
        }

        return monthlyRevenue;
    }

    private static ArrayList<MonthlyRevenueExpense> getMonthlyExpense() {
        ArrayList<MonthlyRevenueExpense> monthlyExpense = new ArrayList<>();
        String q2 = "select sum(i.price * spi.QUANTITY) as expense, year(sp.DATE_OF_PURCHASE) as eyear, month(sp.DATE_OF_PURCHASE) as emonth from stock_purchase sp, stock_purchase_items spi, item i where sp.PURCHASE_ID = spi.PURCHASE_ID and spi.item_id = i.item_id group by year(sp.DATE_OF_PURCHASE), month(sp.DATE_OF_PURCHASE) order by eyear, emonth";

        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand(q2);
            crs.execute();
            while (crs.next()) {
                monthlyExpense.add(new MonthlyRevenueExpense(LocalDate.of(crs.getInt("eyear"), crs.getInt("emonth"), 1), crs.getFloat("expense")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MonthlyRevenueExpense.class.getName()).log(Level.SEVERE, null, ex);
        }

        return monthlyExpense;
    }
    
    /**
     * Returns a list of Expense/Revenue for every month in range, padded with account = 0 if data doesn't exist
     * @param start
     * @param end
     * @param monthlyRevExp
     * @return 
     */
    private static ArrayList<MonthlyRevenueExpense> getPaddedRevExpInRange(LocalDate start, LocalDate end, ArrayList<MonthlyRevenueExpense> monthlyRevExp){
        System.out.println("pulled: " + monthlyRevExp);
        ArrayList<MonthlyRevenueExpense> result = new ArrayList<>();

        long monthsBetween = Period.between(start, end).toTotalMonths() + 1;

        LocalDate iterDate = LocalDate.of(start.getYear(), start.getMonth(), 1);
        
        int revExpIter = 0;
        for (int i = 0; i < monthsBetween; ++i) {
            //If date exists in data, use it and increment
            if (revExpIter < monthlyRevExp.size() && monthlyRevExp.get(revExpIter).getDateOfAccount().equals(iterDate)){
                result.add(new MonthlyRevenueExpense(iterDate, monthlyRevExp.get(revExpIter).getAccountValue()));
                ++revExpIter;
            }
            else{
                result.add(new MonthlyRevenueExpense(iterDate, 0));
            }

            iterDate = iterDate.plusMonths(1);
        }
        return result;
    }

    private LocalDate dateOfAccount;
    private float accountValue;
}
