/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.CachedRowSet;

/**
 *
 * @author azada
 */
public class User {
    
    private String username;
    private String password;
    private String firstName;
    private String lastName;
    private boolean isValid;
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public boolean isIsValid() {
        return isValid;
    }

    public void setIsValid(boolean isValid) {
        this.isValid = isValid;
    }

    public User(String username, String password, String firstName, String lastName, boolean isValid) {
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.isValid = isValid;
    }

    public User() {
    }

    /**
     * Registers user to system. Assumes prior check for username uniqueness
     * @param username
     * @param password
     * @param firstName
     * @param lastName
     * @return 
     */
    public boolean registerToSystem() {
        try {       
            String passwordHashed = getHashedPassword();
            
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("INSERT INTO LOGINUSER (USERNAME, PASSWORD, FIRST_NAME, LAST_NAME) VALUES (?,?,?,?)");
            crs.setString(1, username);
            crs.setString(2, passwordHashed);
            crs.setString(3, firstName);
            crs.setString(4, lastName);
            crs.execute();
            return true;
            
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    /**
     * Login user to system. 
     * Assumes prior check for username existence.
     * Assumes username and password are set only.
     * Will fill additional information of user.
     * @return 
     */
    public boolean loginToSystem() {
        isValid = false;
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT * FROM LOGINUSER WHERE USERNAME = ?");
            crs.setString(1, username);
            crs.execute();
            
            if (!crs.next()){
                return false;
            }
            
            String hashedPassword = getHashedPassword();
            if (crs.getString("password").equals(hashedPassword)){
                isValid = true;
                firstName = crs.getString("first_name");
                lastName = crs.getString("last_name");
            }

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return isValid;
    }
    
    public boolean doesUserExist(){
        try {
            CachedRowSet crs = DbCredentials.getConfiguredConnection();
            crs.setCommand("SELECT USERNAME FROM LOGINUSER WHERE USERNAME = ?");
            crs.setString(1, username);
            crs.execute();
            //Will return true if result is non-empty
            return (crs.next());
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }
    
    /**
     * Helper function to get MD5 hashed password
     * @return 
     */
    private String getHashedPassword(){
        String passwordHashed = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] sign = md.digest(password.getBytes());
            passwordHashed = new String(sign, "UTF-8");
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return passwordHashed;
    }


}
