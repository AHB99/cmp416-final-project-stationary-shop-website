/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.CachedRowSet;

/**
 *
 * @author azada
 */
public class Employee {

    @Override
    public String toString() {
        return "Employee{" + "employeeId=" + employeeId + ", firstName=" + firstName + ", lastName=" + lastName + ", gender=" + gender + ", salary=" + salary + ", address=" + address + ", department=" + department + ", shopBranch=" + shopBranch + ", supervisor=" + supervisor + '}';
    }

    public Employee(int employeeId) {
        this.employeeId = employeeId;
    }

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

    public boolean insertEmployee() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("INSERT INTO EMPLOYEE (FIRST_NAME, LAST_NAME, GENDER, SALARY, ADDRESS, SUPERVISOR_ID, DEPARTMENT_ID, SHOP_ID) VALUES (?,?,?,?,?,?,?,?)");
            crs.setString(1, firstName);
            crs.setString(2, lastName);
            crs.setString(3, gender);
            crs.setFloat(4, salary);
            crs.setString(5, address);

            if (supervisor != null) {
                crs.setInt(6, supervisor.getEmployeeId());
            } else {
                crs.setNull(6, Types.INTEGER);
            }
            if (department != null) {
                crs.setInt(7, department.getDepartmentId());
            } else {
                crs.setNull(7, Types.INTEGER);
            }
            if (shopBranch != null) {
                crs.setInt(8, shopBranch.getShopId());
            } else {
                crs.setNull(8, Types.INTEGER);
            }

            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void retrieveEmployee() {
        if (employeeId == null) {
            return;
        }
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("select * from employee e, department d where e.employee_id = ? and e.department_id = d.department_id");
            crs.setInt(1, employeeId);
            crs.execute();
            if (crs.next()) {
                firstName = crs.getString("first_name");
                lastName = crs.getString("last_name");
                gender = crs.getString("gender");
                salary = crs.getFloat("salary");
                address = crs.getString("address");
                department = new Department(crs.getInt("department_id"), crs.getString("department_name"));
                shopBranch = new ShopBranch(crs.getInt("shop_id"));
                supervisor = new Employee(crs.getInt("supervisor_id"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean deleteEmployee() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("delete from employee where employee_id = ?");
            crs.setInt(1, employeeId);
            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean updateEmployee() {
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("UPDATE EMPLOYEE set FIRST_NAME = ?, LAST_NAME = ?, GENDER = ?, SALARY = ?, ADDRESS = ?, SUPERVISOR_ID = ?, DEPARTMENT_ID = ?, SHOP_ID = ? WHERE EMPLOYEE_ID = ?");
            crs.setString(1, firstName);
            crs.setString(2, lastName);
            crs.setString(3, gender);
            crs.setFloat(4, salary);
            crs.setString(5, address);

            if (supervisor != null) {
                crs.setInt(6, supervisor.getEmployeeId());
            } else {
                crs.setNull(6, Types.INTEGER);
            }
            if (department != null) {
                crs.setInt(7, department.getDepartmentId());
            } else {
                crs.setNull(7, Types.INTEGER);
            }
            if (shopBranch != null) {
                crs.setInt(8, shopBranch.getShopId());
            } else {
                crs.setNull(8, Types.INTEGER);
            }
            
            crs.setInt(9, employeeId);

            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Employee.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    private Integer employeeId;
    private String firstName;
    private String lastName;
    private String gender;
    private float salary;
    private String address;
    private Department department;
    private ShopBranch shopBranch;
    private Employee supervisor;
}
