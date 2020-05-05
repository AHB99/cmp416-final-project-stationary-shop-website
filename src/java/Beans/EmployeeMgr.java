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
            crs.setCommand("select * from employee e, department d where e.department_id = d.department_id");
            crs.execute();
            while (crs.next()) {
                employeeList.add(new Employee(crs.getInt("employee_id"), crs.getString("first_name"),
                crs.getString("last_name"),crs.getString("gender"),crs.getFloat("salary"),
                crs.getString("address"),new Department(crs.getInt("department_id"), crs.getString("department_name")),
                new ShopBranch(crs.getInt("shop_id")),
                new Employee(crs.getInt("supervisor_id"))));              
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void retrieveEmployeesByDepartment(int departmentId) {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("select * from employee e, department d where e.department_id = d.department_id and d.department_id = ?");
            crs.setInt(1, departmentId);
            crs.execute();
            while (crs.next()) {
                employeeList.add(new Employee(crs.getInt("employee_id"), crs.getString("first_name"),
                        crs.getString("last_name"), crs.getString("gender"), crs.getFloat("salary"),
                        crs.getString("address"), new Department(crs.getInt("department_id"), crs.getString("department_name")),
                        new ShopBranch(crs.getInt("shop_id")),
                        new Employee(crs.getInt("supervisor_id"))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void retrieveEmployeesByShop(int shopId) {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("select * from employee e, department d where e.department_id = d.department_id and e.shop_id = ?");
            crs.setInt(1, shopId);
            crs.execute();
            while (crs.next()) {
                employeeList.add(new Employee(crs.getInt("employee_id"), crs.getString("first_name"),
                        crs.getString("last_name"), crs.getString("gender"), crs.getFloat("salary"),
                        crs.getString("address"), new Department(crs.getInt("department_id"), crs.getString("department_name")),
                        new ShopBranch(crs.getInt("shop_id")),
                        new Employee(crs.getInt("supervisor_id"))));
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private ArrayList<Employee> employeeList= new ArrayList<>();
    
}
