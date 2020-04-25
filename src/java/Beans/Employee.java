/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.CachedRowSet;

/**
 *
 * @author azada
 */
public class Employee {

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public ShopBranch getShopBranch() {
        return shopBranch;
    }

    public void setShopBranch(ShopBranch shopBranch) {
        this.shopBranch = shopBranch;
    }

    public Employee getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(Employee supervisor) {
        this.supervisor = supervisor;
    }

    public Employee(int employeeId, String firstName, String lastName, String gender, float salary, String address, Department department, ShopBranch shopBranch, Employee supervisor) {
        this.employeeId = employeeId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.salary = salary;
        this.address = address;
        this.department = department;
        this.shopBranch = shopBranch;
        this.supervisor = supervisor;
    }

    public Employee() {
    }
    
    
    private boolean insertEmployee(){
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("INSERT INTO EMPLOYEE (FIRST_NAME, LAST_NAME, GENDER, SALARY, ADDRESS, SUPERVISOR_ID, DEPARTMENT_ID, SHOP_ID) VALUES (?,?,?,?,?,?,?,?)");
            crs.setString(1,firstName);
            crs.setString(2, lastName);
            crs.setString(3, gender);
            crs.setFloat(4, salary);
            crs.setString(5, address);
            crs.setInt(6, supervisor.getEmployeeId());
            crs.setInt(7, department.getDepartmentId());
            crs.setInt(8, shopBranch.getShopId());
            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    private int employeeId;
    private String firstName;
    private String lastName;
    private String gender;
    private float salary;
    private String address;
    private Department department;
    private ShopBranch shopBranch;
    private Employee supervisor;
}
