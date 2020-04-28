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
    }
    
    public void retrieveEmployees(){
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM EMPLOYEE");
            crs.execute();
            while (crs.next()) {
                employeeList.add(new Employee(crs.getInt("employee_id"), crs.getString("first_name"),
                crs.getString("last_name"),crs.getString("gender"),crs.getFloat("salary"),
                crs.getString("address"),new Department(crs.getInt("department_id")),
                new ShopBranch(crs.getInt("shop_id")),
                new Employee(crs.getInt("supervisor_id"))));              
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private ArrayList<Employee> employeeList= new ArrayList<>();
    
}
