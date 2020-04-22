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
import javax.sql.rowset.RowSetProvider;

/**
 *
 * @author azada
 */
public class DbCredentials {

    public DbCredentials() {
    }

    public static String getDbname() {
        return dbname;
    }

    public static void setDbname(String dbname) {
        DbCredentials.dbname = dbname;
    }

    public static String getDbuser() {
        return dbuser;
    }

    public static void setDbuser(String dbuser) {
        DbCredentials.dbuser = dbuser;
    }

    public static String getDbpass() {
        return dbpass;
    }

    public static void setDbpass(String dbpass) {
        DbCredentials.dbpass = dbpass;
    }
    
    /**
     * Helper function to get a CRS
     * @return 
     */
    public static CachedRowSet getConfiguredConnection() {
        CachedRowSet crs = null;
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");            
            crs = RowSetProvider.newFactory().createCachedRowSet();
            crs.setUrl(DbCredentials.getDbname());
            crs.setUsername(DbCredentials.getDbuser());
            crs.setPassword(DbCredentials.getDbpass());

        } catch (ClassNotFoundException ex) { 
            Logger.getLogger(DbCredentials.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DbCredentials.class.getName()).log(Level.SEVERE, null, ex);
        }
        return crs;
    }
    
    private static String dbname;
    private static String dbuser;
    private static String dbpass;
    
}
