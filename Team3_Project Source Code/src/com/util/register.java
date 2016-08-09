
package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;


public class register {

    String username = "";
    String password = "";
    Connection con;
    String query;
    PreparedStatement pstmt;
    ResultSet rs;
    Statement stmt;
    int i;
    boolean registration_successful;
    String username_exists="false";
    
    public String if_username_exists(String username) {
        this.username = username;
        query = "select username from login_details";        
        con = DAOConnection.sqlconnection();
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            while (rs != null && rs.next()) {
                if (rs.getString(1).equalsIgnoreCase(username)) {
                    //System.out.println("usrename_exists_in_database" + rs.getString(1));
                    username_exists = "true";
                } //else {
//                    System.out.println("THIS IS DEFINITELY A NEW USER" + rs.getString(1));
//                }
            }
        } catch (SQLException ex) {
            System.out.println("exception caught while reading username = " + ex);
        } finally {
            try {
                if (con != null) {
                    con.close();
                    System.out.println("Connection Terminated");
                }
            } catch (SQLException e) {
                System.out.println("The exception caught is = " + e);
            }
        }
        return username_exists;
    }

    public boolean register_user(String username, String password) {
        this.username = username;
        this.password = password;
        System.out.println("username from register method=" + username + "password=" + password);
        try {
            con = DAOConnection.sqlconnection();
            query = "insert into login_details values(?,?,?,?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, null);
            pstmt.setString(2, username);
            pstmt.setString(3, password);
            pstmt.setString(4, "user");
            i = pstmt.executeUpdate();
            if (i > 0) {
                System.out.println("User information successfully added to database");
            }
            registration_successful = true;
        } catch (SQLException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (con != null) {
                    con.close();
                    System.out.println("Connection Terminated");
                }
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                System.out.println("Exception caught is = " + e);
            }
        }
        return registration_successful;
    }
}
