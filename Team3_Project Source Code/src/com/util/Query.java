package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.HashMap;
import java.util.logging.Logger;

public class Query {

    static Connection con;
    static Statement stmt;
    static PreparedStatement ps;
    static String query;
    static ResultSet rs;
    static ArrayList list = new ArrayList();
    static ProductDetails productdetails = new ProductDetails();  //class name instantiation. 
    static HashMap<String, ArrayList<String>> map = new HashMap<String, ArrayList<String>>();

    public static HashMap<String, ArrayList<String>> get_product_info(String classifier_name) {
        try {
            con = DAOConnection.sqlconnection();
            if (classifier_name.equalsIgnoreCase("books")) {
                query = "select book_name,author_name,book_description,book_price,books_id from books";
            }
            if (classifier_name.equalsIgnoreCase("electronics")) {
                query = "select brand_name,store_name,brand_description,brand_price,electronics_id from electronics";
            }
            if (classifier_name.equalsIgnoreCase("icecream")) {
                query = "select icecream_name,store_name,icecream_description,icecream_price,icecream_id from icecream";
            }
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            ArrayList<String> productname = new ArrayList<String>();
            ArrayList<String> brandname = new ArrayList<String>();
            ArrayList<String> productdescription = new ArrayList<String>();
            ArrayList<String> productprice = new ArrayList<String>();
            ArrayList<String> productid = new ArrayList<String>();

            while (rs != null && rs.next()) {
                productname.add(rs.getString(1));       // using 4 objects to get 4 different values from a db         
                brandname.add(rs.getString(2));         // and storing it in a list
                productdescription.add(rs.getString(3));
                productprice.add(rs.getString(4));
                productid.add(rs.getString(5));
            }
            productdetails.setProduct_name(productname);
            System.out.println("Getting product name from get_product_info = " + productdetails.getProduct_name());
            productdetails.setProduct_brand(brandname);
            System.out.println("Getting product brand from get_product_info = " + productdetails.getProduct_brand());
            productdetails.setProduct_description(productdescription);
            System.out.println("Getting product description from get_product_info = " + productdetails.getProduct_description());
            productdetails.setProduct_price(productprice);
            System.out.println("Getting product price from get_product_info = " + productdetails.getProduct_price());


            map.put("productname", productname);      //list values are stored in a map so, that, we could  
            map.put("brandname", brandname);          //return the map object there by all the 4 list objects are passed. 
            map.put("productdescription", productdescription);
            map.put("productprice", productprice);
            map.put("productid",productid);
        } catch (SQLException ex) {
            Logger.getLogger(Query.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                    System.out.println("Conntection Terminated after retrieving the product information");
                } catch (SQLException ex) {
                    Logger.getLogger(Query.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Query.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return map;
    }

//    public ProductDetails getProductDetails() {
//        productdetails.setProduct_name(productname);
//        productdetails.setProduct_brand(brandname);
//        productdetails.setProduct_description(productdescription);
//        productdetails.setProduct_price(productprice);
//        return productdetails;
//    }
//    static void clearSession() {
//        throw new UnsupportedOperationException("Not yet implemented");
//    }
    public void insert_data(String classifier_name) {
        try {
            con = DAOConnection.sqlconnection();
            if (classifier_name.equals("books")) {
                // query = "insert into books values books_id = ' " + null + "' book_name = '" + book_name + 
                //      "' author_name = '" + author_name + "' book_description = '" + book_desc + "' book_price = '" + price + "'";
                query = "insert into employee_details values (3,'Vishnu')";
            }
            if (classifier_name.equals("electronics")) {
                query = "select brand_name,store_name,brand_description,brand_price from electronics";
            }
            if (classifier_name.equals("icecream")) {
                query = "select icecream_name,store_name,icecream_description,icecream_price from icecream";
            }
            ps = con.prepareStatement(query);
            rs = ps.executeQuery(query);
            ArrayList<String> productname = new ArrayList<String>();
            ArrayList<String> brandname = new ArrayList<String>();
            ArrayList<String> productdescription = new ArrayList<String>();
            ArrayList<String> productprice = new ArrayList<String>();

            while (rs != null && rs.next()) {
                productname.add(rs.getString(1));       // using 4 objects to get 4 different values from a db         
                brandname.add(rs.getString(2));         // and storing it in a list
                productdescription.add(rs.getString(3));
                productprice.add(rs.getString(4));
            }
            productdetails.setProduct_name(productname);
            System.out.println("Getting product name from get_product_info = " + productdetails.getProduct_name());
            productdetails.setProduct_brand(brandname);
            System.out.println("Getting product brand from get_product_info = " + productdetails.getProduct_brand());
            productdetails.setProduct_description(productdescription);
            System.out.println("Getting product description from get_product_info = " + productdetails.getProduct_description());
            productdetails.setProduct_price(productprice);
            System.out.println("Getting product price from get_product_info = " + productdetails.getProduct_price());


            map.put("productname", productname);      //list values are stored in a map so, that, we could  
            map.put("brandname", brandname);          //return the map object there by all the 4 list objects are passed. 
            map.put("productdescription", productdescription);
            map.put("productprice", productprice);
        } catch (SQLException ex) {
            Logger.getLogger(Query.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                    System.out.println("Conntection Terminated after retrieving the product information");
                } catch (SQLException ex) {
                    Logger.getLogger(Query.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Query.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public String insert_data_into_db(String classifier_name, String admin_product_name, String admin_product_author_store_name, String admin_product_description, String admin_product_price) {
        String insertion_result = "";
        System.out.println("admin_product_price = " + admin_product_price);
        System.out.println("admin_product_author_store_name = " + admin_product_author_store_name);
        System.out.println("admin_product_description = " + admin_product_description);
        System.out.println("admin_product_name = " + admin_product_name);
        try {
            con = DAOConnection.sqlconnection();

            if (classifier_name.equals("Books")) {
                query = " insert into books values (?,?,?,?,?)";
            }
            if (classifier_name.equals("Electronics")) {
                query = " insert into electronics values (?,?,?,?,?)";
            }
            if (classifier_name.equals("Icecream")) {
                query = " insert into icecream values (?,?,?,?,?)";
            }

            ps = con.prepareStatement(query);
            ps.setString(1, null);
            ps.setString(2, admin_product_name);
            ps.setString(3, admin_product_author_store_name);
            ps.setString(4, admin_product_description);
            ps.setString(5, admin_product_price);
            int i = ps.executeUpdate();

            if (i > 0) {
                System.out.println("Insertion into database done successfully!");
                insertion_result = "success";

            } else {
                System.out.println("Failed to insert into database");
                insertion_result = "failure";
            }
        } catch (SQLException ex) {
            Logger.getLogger(Query.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                    System.out.println("Conntection Terminated after sucessful/failure insertion into db");
                } catch (SQLException ex) {
                    Logger.getLogger(Query.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Query.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return insertion_result;
    }

    
    String remove_data(String classifier_name, String admin_radio_selection, String admin_id_or_name) {
        String db_delete_result = "";
        System.out.println("admin_radio_selection = " + admin_radio_selection);
        System.out.println("admin_id_or_name = " + admin_id_or_name);
        System.out.println("classifier_name = " + classifier_name);
        try {
            con = DAOConnection.sqlconnection();
            stmt = con.createStatement();
            if (classifier_name.equalsIgnoreCase("Books")) {
                if (admin_radio_selection.equals("id")) {
                    query = " DELETE FROM books WHERE books_id = '" + admin_id_or_name + "'";
                } else {
                    query = " DELETE FROM books WHERE book_name = '" + admin_id_or_name + "'";
                }
            }
            if (classifier_name.equalsIgnoreCase("Electronics")) {
                if (admin_radio_selection.equals("id")) {
                    query = " DELETE FROM electronics WHERE electronics_id = '" + admin_id_or_name + "'";
                } else {
                    query = " DELETE FROM electronics WHERE brand_name = '" + admin_id_or_name + "'";
                }
            }
            if (classifier_name.equalsIgnoreCase("Icecream")) {
                if (admin_radio_selection.equals("id")) {
                    query = " DELETE FROM icecream WHERE icecream_id = '" + admin_id_or_name + "'";
                } else {
                    query = " DELETE FROM icecream WHERE icecream_name = '" + admin_id_or_name + "'";
                }
            }
            
            int i = stmt.executeUpdate(query);
            

            if (i > 0) {
                System.out.println("Deleted from database successfully!");
                db_delete_result = "success";

            } else {
                System.out.println("Failed to delete from database");
                db_delete_result = "failure";
            }
        } catch (SQLException ex) {
            Logger.getLogger(Query.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                    System.out.println("Conntection Terminated after sucessful/failure deletion from db");
                } catch (SQLException ex) {
                    Logger.getLogger(Query.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Query.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return db_delete_result;
    }

    String update_data_into_db(String classifier_name, String admin_product_id, String admin_product_name,
                        String admin_product_author_store_name, String admin_product_description, String admin_product_price) {
        String db_update_result="";
        try {
            con = DAOConnection.sqlconnection();
            stmt = con.createStatement();
            if (classifier_name.equals("Books")) {                
                    query = "update books set book_name='"+admin_product_name+"',author_name='"+admin_product_author_store_name+"',book_description='"
                        +admin_product_description+"',book_price='"+admin_product_price+"'where books_id='"+admin_product_id+"'";
            }
            if (classifier_name.equals("Electronics")) {                 
                    query = "update electronics set brand_name='"+admin_product_name+"',store_name='"+admin_product_author_store_name+"',brand_description='"
                        +admin_product_description+"',brand_price='"+admin_product_price+"'where electronics_id='"+admin_product_id+"'";
            }
            if (classifier_name.equals("Icecream")) {
                    query = "update icecream set icecream_name='"+admin_product_name+"',store_name='"+admin_product_author_store_name+"',icecream_description='"
                        +admin_product_description+"',icecream_price='"+admin_product_price+"'where icecream_id='"+admin_product_id+"'";
            }            
            int i = stmt.executeUpdate(query);
            if (i > 0) {
                System.out.println("Updated into database successfully!");
                db_update_result = "success";
            } else {
                System.out.println("Failed to update into database");
                db_update_result = "failure";
            }
        } catch (SQLException ex) {
            Logger.getLogger(Query.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                    System.out.println("Conntection Terminated after sucessful/failure deletion from db");
                } catch (SQLException ex) {
                    Logger.getLogger(Query.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Query.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return db_update_result;
    }
}// class query ends here..
