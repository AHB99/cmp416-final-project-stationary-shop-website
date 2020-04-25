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
public class DepartmentMgr {

    public ArrayList<Department> getDepartmentList() {
        return departmentList;
    }

    public void setDepartmentList(ArrayList<Department> departmentList) {
        this.departmentList = departmentList;
    }

    public DepartmentMgr() {
        departmentList = new ArrayList<>();
    }
    
    private void retrieveDepartments(){
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM DEPARTMENT");
            crs.execute();
            while (crs.next()){
                departmentList.add(new Department(crs.getInt("department_id"), crs.getString("department_name")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentMgr.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private ArrayList<Department> departmentList;
    
}
