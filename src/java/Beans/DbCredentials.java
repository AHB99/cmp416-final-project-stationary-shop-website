/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;
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
    private static String dbname;
    private static String dbuser;
    private static String dbpass;
    
}
