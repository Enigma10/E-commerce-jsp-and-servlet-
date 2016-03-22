
package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

public class authentication {

    String username = "";
    String password = "";
    boolean result;
    Connection con;
    PreparedStatement pstmt;
    Statement stmt;
    String query;
    ResultSet rs;
    String authentication_status;
    String IsAdmin;
    HashMap<String, String> authentication_status_map = new HashMap<String, String>(); // holds user authentication and whether or not he is an user/admin and a legitimate user.

    public HashMap<String, String> authenticate(String username, String password) {
        try {
            this.username = username;
            this.password = password;
            con = DAOConnection.sqlconnection();
            query = "select password from login_details where username='" + username + "'";
            pstmt = con.prepareStatement(query);
            rs = pstmt.executeQuery();
            while (rs != null && rs.next()) {
                String db_password = rs.getString(1);
                if (db_password.equals(password)) {
                    System.out.println("The password matches");
                    authentication_status = "true";
                    //check if admin
                    IsAdmin = isAdmin();
                } else {
                    System.out.println("Password doesn't match");
                    authentication_status = "false";
                }
            }
          authentication_status_map.put("authentication_status", authentication_status);
          authentication_status_map.put("IsAdmin", IsAdmin);
            System.out.println("authentication_status_map = " + authentication_status_map );
        } catch (SQLException ex) {
            Logger.getLogger(authentication.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                    System.out.println("Connection Terminated!");
                } catch (SQLException ex) {
                    Logger.getLogger(authentication.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(authentication.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return authentication_status_map;
    }

    public String isAdmin() {
        try {
            query = "select admin from login_details where username='" + username + "'";
            pstmt = con.prepareStatement(query);
            rs = pstmt.executeQuery();
            while (rs != null && rs.next()) {
                IsAdmin = rs.getString(1);
                if (IsAdmin.equals("admin")) {
                    System.out.println("The user is an admin");
                    IsAdmin = "admin";                    
                }
                else{
                    IsAdmin = "user";
                    System.out.println("The user is an user");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(authentication.class.getName()).log(Level.SEVERE, null, ex);
        }
        return IsAdmin;
    }
}