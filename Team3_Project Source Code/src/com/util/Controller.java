package com.util;
//import com.util.validate;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    int total_cart_items = 0;
    SessionBean bean = new SessionBean();
    HashMap map = new HashMap();
    ArrayList list = new ArrayList();
    ArrayList products_in_cart_list = new ArrayList();
    ArrayList<String> quantities_in_cart = new ArrayList<String>();
    ArrayList user_product_name = new ArrayList();
    CartDetails mycart = new CartDetails();
    ProductDetails sessionbean = new ProductDetails();
    Query queryObject = new Query();
    HashMap authentication_status_map = new HashMap();
    //ProductDetails productdetails = (ProductDetails) queryObject.getProductDetails();  //initializing productdetails object. //neeed to uncomment this line...

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        try {
            out.println("<h1>Servlet Controller at " + request.getContextPath() + "</h1>");
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login_name;
        String login_password;
        String registration_username;
        String registration_password;
     //   String registration_emailaddress;
        boolean result;
        String username_exists;
        RequestDispatcher rd;
        HttpSession session = request.getSession(true);
        session.setAttribute("Order_Confirmation", null);

        // Case for logout!

        if (request.getParameter("signout") != null) {
            System.out.println("Reached log out in the controller!!");
            //Query.clearSession();            
            session.setAttribute("authentication", null);
            session.removeAttribute("authentication"); //clearing the authentication
            session.setAttribute("name", null); // clearing the session name
            session.removeAttribute("product_name");
            session.removeAttribute("productname");
            session.removeAttribute("db_insertion_result");
            session.removeAttribute("db_deletion_result");
            session.removeAttribute("db_update_result");            
            session.removeAttribute("productdescription");
            session.removeAttribute("brandname");
            session.removeAttribute("productprice");
            session.removeAttribute("quantity_in_cart");
            session.setAttribute("product_in_cart",null);
            session.removeAttribute("product_in_cart");
            session.setAttribute("classifier_name", null);
            session.removeAttribute("classifier_name");
            total_cart_items = 0;
            session.removeAttribute("total_cart_items");
            response.setHeader("Cache-Control", "no-store"); //when you hit back, it displays "Confirm page Submission"
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        }

        //Case for Login Submit

        if (request.getParameter("login_submit") != null) {
            login_name = request.getParameter("login_name");
            System.out.println("login_name before trimming = " + login_name);
            System.out.println("login_name after trimming = " + login_name.trim()); // what it does is, if the username is
            login_password = request.getParameter("login_password");                  // "  my_name" it reads the username as  
            System.out.println("login_password = " + login_password.trim());        // "my_name"
            username_exists = new register().if_username_exists(login_name.trim());
            if (username_exists.equals("false")) {
                session.setAttribute("authentication", "Auth_Failure");
                rd = request.getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
            }
            if (username_exists.equals("true")) {
                authentication_status_map = new authentication().authenticate(login_name.trim(), login_password.trim()); //check for admin here. redirect 2 admin page..
                String authentication_status = (String) authentication_status_map.get("authentication_status");
                String IsAdmin = (String) authentication_status_map.get("IsAdmin");
                System.out.println("Authentication status = " + authentication_status + " user = " + IsAdmin);
                if (authentication_status.equals("true")) {
                    bean.setName(login_name);
                    request.setAttribute("name", login_name);
                    session.setAttribute("name", login_name);
                    System.out.println("Authentication Succesfull. User granted permission!!");
                    if (IsAdmin.equals("user")) {
                        session.setAttribute("authentication", "Auth_Success");
                        rd = request.getRequestDispatcher("/user_cart.jsp");
                        rd.forward(request, response);
                    } else {
                        session.setAttribute("authentication", "Auth_Success");
                        session.setAttribute("IsAdmin", "yes");
                        rd = request.getRequestDispatcher("/admin.jsp");
                        rd.forward(request, response);
                    }

                } else {
                    System.out.println("Username or Password does not exists!!");
                    session.setAttribute("authentication", "Auth_Failure");
                    rd = request.getRequestDispatcher("/index.jsp");
                    rd.forward(request, response);
                }
            }
        }

        //Case for registration submit  

        if (request.getParameter("registration_submit") != null) {
            registration_username = request.getParameter("registration_username");
            registration_password = request.getParameter("registration_password");
            System.out.println("registration_username before trimming = " + registration_username);
            System.out.println("registration username after trimming = " + registration_username.trim());
            System.out.println("registration_password = " + registration_password.trim());
            //Below code checks if the username or password is Null.
            //The following code is not necessary becauase, i have used JavaScript for Form Validations.
            // Just kept this code as backup and understanding purposes!
            if (registration_password.trim().equals("") || registration_username.trim().equals("")) {
                System.out.println("password equal");
                PrintWriter out = response.getWriter();
                response.setContentType("text/html");
                try {
                    out.println("<h1> Username or Password cannot be Null </h1>");
                } finally {
                    out.close();
                }
            }
            username_exists = new register().if_username_exists(registration_username.trim());
            System.out.println("username_exists true or false= " + username_exists);
            response.setContentType("text/html"); // need to change it later to reduce the codes that follow it..
            if (username_exists.equals("true")) {
                PrintWriter out = response.getWriter();
                try {
                    out.println("<h1> Username Taken </h1>");
                } finally {
                    out.close();
                }
            } else {
                result = new register().register_user(registration_username.trim(), registration_password.trim());
                if (result == true) {
                    PrintWriter out = response.getWriter();
                    try {
                    	RequestDispatcher dispatcher = request.getRequestDispatcher("registersuccess.jsp");
                    	dispatcher.forward(request, response);
                        //out.println("<h1> Registration Successful </h1>");
                    } finally {
                        out.close();
                    }
                } else {
                    PrintWriter out = response.getWriter();
                    try {
                        out.println("<h1> Registration Failure </h1>");
                    } finally {
                        out.close();
                    }
                }
            }
        } // registration_submit ends here..

        //get the product info..
        if (request.getParameter("product") != null) {
            String classifier_name = (String) request.getParameter("Item");
            System.out.println("the product selected by user is = " + classifier_name);
            map = new Query().get_product_info(classifier_name);
            //sessionbean.setProduct_name((ArrayList) map.get("productname"));
            //productdetails.setProduct_name((ArrayList) map.get("productname"));

            System.out.println("The session bean product name from controller = " + sessionbean.getProduct_name());
//            System.out.println("product details object name = " + productdetails.getProduct_name());
//            System.out.println("product details object brand = " + productdetails.getProduct_brand());
//            System.out.println("product details object name = " + productdetails.getProduct_description());
//            System.out.println("product details object name = " + productdetails.getProduct_price());
            session.setAttribute("productname", map.get("productname"));
            session.setAttribute("brandname", map.get("brandname"));
            session.setAttribute("productdescription", map.get("productdescription"));
            session.setAttribute("productprice", map.get("productprice"));
            session.setAttribute("productid", map.get("productid"));
            session.setAttribute("authentication", "Auth_Success"); //need to use a session bean here..
            //need to use a session bean to add the user name as well. to remove the login , password text box popup
            rd = request.getRequestDispatcher("/user_cart.jsp");
            rd.forward(request, response);
        } //get product info ends here

        //get the cart details
        if (request.getParameter("cartdetails") != null) {
            String itemnames[] = request.getParameterValues("quantity"); //used to retrevie multiple values which has same names.                             
            user_product_name = (ArrayList) session.getAttribute("product_name");

            for (int i = 0; i < itemnames.length; i++) {
                System.out.println("the values are = " + itemnames[i]);
                System.out.println("The product selected = " + user_product_name.get(i));
                if (itemnames[i] == "") {
                    System.out.println("This product  \" " + user_product_name.get(i) + " \"is not selected");//skipping item, if quantity is 0                    
                } else {
                    total_cart_items = total_cart_items + (Integer.parseInt(itemnames[i])); //---> convert string array integer                     
                    quantities_in_cart.add(itemnames[i]);
                    products_in_cart_list.add(user_product_name.get(i));
                    System.out.println("produts obtained in the cart are = " + products_in_cart_list);
                }
            }
            DomParsing.writexml(quantities_in_cart, products_in_cart_list);
            session.setAttribute("total_cart_items", total_cart_items);
            session.setAttribute("product_in_cart", products_in_cart_list);
            session.setAttribute("quantity_in_cart", quantities_in_cart);
            System.out.println("cart quantity = " + session.getAttribute("product_in_cart"));
            System.out.println("cart quantity = " + session.getAttribute("quantity_in_cart"));
            rd = request.getRequestDispatcher("/user_cart.jsp");
            rd.forward(request, response);
        } // get cart details ends here

        //checkout the cart
        if (request.getParameter("checkout_cart") != null) {
            rd = request.getRequestDispatcher("/loaded_cart.jsp");
            rd.forward(request, response);
        }

        //payment options
        if (request.getParameter("payment") != null) {
            rd = request.getRequestDispatcher("/payment.jsp");
            rd.forward(request, response);
        }

        //payment details collection
        if (request.getParameter("place_order") != null) {
            System.out.println("into place order!!");
            //get credit card information
            String card_type = (String) request.getParameter("card_type");
            String card_name = request.getParameter("card_name");
            String expiration_month = (String) request.getParameter("expiration_month");
            String expiration_year = (String) request.getParameter("expiration_year");


            //get billing information
            String fullname = request.getParameter("fullname");
            String address = request.getParameter("address");
            String country = request.getParameter("country");
            String zipcode = request.getParameter("zipcode");
            session.setAttribute("Order_Confirmation", "Confirmed");
            String Confirmation_Status = (String) session.getAttribute("Order_Confirmation");
            System.out.println("Confirmation_Status = " + Confirmation_Status); //setting the order status as confirmed as no errors so far..
            DomParsing.card_n_shipping_info(card_type, card_name, expiration_month, expiration_year, fullname, address, country, zipcode);
            rd = request.getRequestDispatcher("/payment.jsp");
            rd.forward(request, response);
        } //payment and billing information ends here

        //if (request.getParameter("admin_changes") != null) {

        //admin db insertion
        if (request.getParameter("admin_catagory") != null) {
            String classifier_name = (String) request.getParameter("admin_classifer_choice");
            System.out.println("the product selected by admin is = " + classifier_name);
            session.setAttribute("classifier_name", classifier_name);

            String admin_mode = (String) session.getAttribute("admin_mode");
            if (admin_mode.equals("insert")) {
                rd = request.getRequestDispatcher("/admin_insert.jsp");
                rd.forward(request, response);
            }
            if (admin_mode.equals("update")) {
                rd = request.getRequestDispatcher("/admin_update.jsp");
                rd.forward(request, response);
            }
            if (admin_mode.equals("remove")) {
                rd = request.getRequestDispatcher("/admin_remove.jsp");
                rd.forward(request, response);
            }
        }

        //admin db insert/update goes here
        if (request.getParameter("admin_db_changes") != null) {
            String admin_mode = (String) session.getAttribute("admin_mode"); //using admin mode to switch between insert/update
            String classifier_name = (String) session.getAttribute("classifier_name");
            String admin_product_name = request.getParameter("admin_product_name");
            String admin_product_author_store_name = request.getParameter("admin_product_author_store_name");
            String admin_product_description = request.getParameter("admin_product_description");
            String admin_product_price = request.getParameter("admin_product_price");
            if (admin_mode.equals("insert")) {
                String db_insertion_result;
                db_insertion_result = new Query().insert_data_into_db(classifier_name, admin_product_name, admin_product_author_store_name, admin_product_description, admin_product_price);
                session.setAttribute("db_insertion_result", db_insertion_result);
                rd = request.getRequestDispatcher("/admin_insert.jsp");
                rd.forward(request, response);

            }
            if (admin_mode.equals("update")) {
                String db_update_result="";
                String admin_product_id=request.getParameter("admin_product_id");
                db_update_result = new Query().update_data_into_db(classifier_name, admin_product_id, admin_product_name, admin_product_author_store_name, admin_product_description, admin_product_price);
                session.setAttribute("db_update_result", db_update_result);
                rd = request.getRequestDispatcher("/admin_update.jsp");
                rd.forward(request, response);

            }
        }//admin db insertion/update ends here
        
        //admin db remove
        if (request.getParameter("admin_db_delete") != null) {            
            String classifier_name = (String) session.getAttribute("classifier_name");
            String admin_radio_selection = request.getParameter("admin_radio_delete");
            //System.out.println("admin_radio_selection = " + admin_radio_selection);
            String admin_id_or_name = request.getParameter("admin_id_or_name");
            //System.out.println("admin_id_or_name = " + admin_id_or_name);
            String db_deletion_result = "";
            db_deletion_result = new Query().remove_data(classifier_name,admin_radio_selection,admin_id_or_name);
            session.setAttribute("db_deletion_result",db_deletion_result);
            rd = request.getRequestDispatcher("/admin_remove.jsp");
            rd.forward(request, response);
        }//admin db insertion ends here

        //admin view all mode
        if (request.getParameter("admin_view_all_products") != null) {            
            String classifier_name = request.getParameter("admin_classifer_choice");
            session.setAttribute("classifier_name",classifier_name);
            System.out.println("classifier_name from view all = " + classifier_name);
            map = new Query().get_product_info(classifier_name);            
            session.setAttribute("productname", map.get("productname"));
            session.setAttribute("brandname", map.get("brandname"));
            session.setAttribute("productdescription", map.get("productdescription"));
            session.setAttribute("productprice", map.get("productprice"));            
            session.setAttribute("productid", map.get("productid"));            
            rd = request.getRequestDispatcher("/admin_view_all.jsp");
            rd.forward(request, response);            
        }     
     
        
        // }//admin product changes ends here



    }// post method ends here
}//servlet class ends here
