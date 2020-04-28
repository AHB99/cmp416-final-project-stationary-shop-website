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
public class Department {

    @Override
    public String toString() {
        return "Department{" + "departmentId=" + departmentId + ", departmentName=" + departmentName + '}';
    }

    public Department(int departmentId) {
        this.departmentId = departmentId;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public Department() {
    }

    public Department(int departmentId, String departmentName) {
        this.departmentId = departmentId;
        this.departmentName = departmentName;
    }
    
    public boolean insertDepartment(){
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("INSERT INTO DEPARTMENT (DEPARTMENT_NAME) VALUES (?)");
            crs.setString(1,departmentName);
            crs.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Department.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    /**
     * Updates fields from db
     * Preconditions: Assumes departmentId set
     */
    public void retrieveDepartment(){
        if (departmentId == null) return;
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("select * from department where department_id = ?");
            crs.setInt(1, departmentId);
            crs.execute();
            if (crs.next()){
                departmentName = crs.getString("department_name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Department.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private Integer departmentId;
    private String departmentName;
    
    
}
