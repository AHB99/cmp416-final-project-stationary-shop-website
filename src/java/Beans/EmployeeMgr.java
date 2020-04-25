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
public class EmployeeMgr {

    public ArrayList<Employee> getEmployeeList() {
        return employeeList;
    }

    public void setEmployeeList(ArrayList<Employee> employeeList) {
        this.employeeList = employeeList;
    }

    public EmployeeMgr() {
        employeeList = new ArrayList<>();
    }
    
    public void retrieveEmployees(){
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT E1.EMPLOYEE_ID AS EMPLOYEE_ID, E1.FIRST_NAME AS FIRST_NAME, E1.LAST_NAME AS LAST_NAME, E1.GENDER AS GENDER, E1.SALARY AS SALARY, E1.ADDRESS AS ADDRESS, E1.SUPERVISOR_ID AS SUPERVISOR_ID, E1.DEPARTMENT_ID AS DEPARTMENT_ID, E1.SHOP_ID AS SHOP_ID, D.DEPARTMENT_NAME AS DEPARTMENT_NAME, S.LOCATION AS SHOP_LOCATION, S.SQUARE_FOOTAGE AS SHOP_SQUARE_FOOTAGE, E2.FIRST_NAME AS SUPERVISOR_FIRST_NAME, E2.LAST_NAME SUPERVISOR_LAST_NAME FROM EMPLOYEE E1, DEPARTMENT D, SHOP_BRANCH S, EMPLOYEE E2 WHERE E1.DEPARTMENT_ID = D.DEPARTMENT_ID AND E1.SHOP_ID = S.SHOP_ID AND E1.SUPERVISOR_ID = E2.EMPLOYEE_ID");
            crs.execute();
            while (crs.next()) {
                employeeList.add(new Employee(crs.getInt("employee_id"), crs.getString("first_name"),
                crs.getString("last_name"),crs.getString("gender"),crs.getFloat("salary"),
                crs.getString("address"),new Department(crs.getInt("department_id"), crs.getString("department_name")),
                new ShopBranch(crs.getInt("shop_id"),crs.getString("shop_location"),crs.getFloat("shop_square_footage")),
                new Employee(crs.getInt("supervisor_id"),crs.getString("supervisor_first_name"),crs.getString("supervisor_last_name"),null,0,null,null,null,null)));              
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private ArrayList<Employee> employeeList;
    
}
