<%@page import = "com.util.CartDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.util.ProductDetails" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.HashMap" %>


<% ProductDetails pro = new ProductDetails() ;  //instantiating ProductDetails class and calling the getter mthods.
CartDetails mycart = new CartDetails();
out.println("the product list from the JSP PAGE is = " + pro.getProduct_name());  %>

<%
    String name = null;
    //name = (String) request.getAttribute("name");  // very much needed line. use setters and getters instead of this.
    ArrayList productname = new ArrayList();
    ArrayList productdescription = new ArrayList();
    ArrayList brandname = new ArrayList();
    ArrayList productprice = new ArrayList();
    //getAttribute and setAttribute always works
    productname = (ArrayList) request.getAttribute("productname");
    productdescription = (ArrayList) request.getAttribute("productdescription");
    brandname = (ArrayList) request.getAttribute("brandname");
    productprice = (ArrayList) request.getAttribute("productprice");
    //calling setters and getters testing
    pro.setProduct_name(productname); System.out.println("newwww product details are = " + pro.getProduct_name());
    pro.setProduct_description(productdescription); System.out.println("newwww product details are = " + pro.getProduct_description());
    pro.setProduct_brand(brandname); System.out.println("newwww product details are = " + pro.getProduct_brand());
    pro.setProduct_price(productprice); System.out.println("newwww product details are = " + pro.getProduct_price());
    System.out.println("retriving the product name from bean = " + pro.getProduct_name()); //retreiving the product name from the bean.
    out.println("retriving the product name from bean = " + pro.getProduct_name()); //retreiving the product name from the bean.
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="vijays_shop.css">
        <title>JSP Page</title>
    </head>
    <body>
        <% String authentication = (String) request.getAttribute("authentication");
            if (authentication == null) {
        %>
        <div id="login_in">
            <form name="Home_Page" action="Controller" method="Post">
                <div align="right">                       
                    Username    <input  type="text" maxlength="40" name="login_name"> &nbsp;&nbsp;
                    Password    <input type="password" maxlength="40" name="login_password">             
                    <input type="submit" name="login_submit" value="Submit" onclick="check();">             
                    <a href="registration.jsp"> Register </a>
                </div>                    
            </form>
            <% }
                if (authentication != null) {
                    if (authentication.equals("Auth_Success")) {
            %>
            <div id="user_info"> Swagatam   <span style="color:green">   <i> <!--%= name %-->! </i>  </span> </div>
            <form name="logout" action="Controller" method="Post">
                <div class="logmeout"> <input type="submit" name="signout" value="logmeoutplz"> </div>
            </form>            
            <%} else {%>
            <div id="wrong_user"> <span style="color:red"> Username/Password is wrong! </span> </div>
            <form name="Home_Page" action="Controller" method="Post">
                <div id="login_in" align="right">                       
                    Username    <input  type="text" maxlength="40" name="login_name"> &nbsp;&nbsp;
                    Password    <input type="password" maxlength="40" name="login_password">             
                    <input type="submit" name="login_submit" value="Submit" onclick="check();">             
                    <a href="registration.jsp"> Register </a>
                </div>                    
            </form>

            <%}
                }%>

        </div>  
        <div id="big_wrapper">            
            <header id="top_header"> Team 3 Sales System</header>
            <nav id="links"> 
                <ul>
                    <li> <a href="http://indiasimprovement.com"> Home </a> </li>
                    <li> <a href="http://indiasimprovement.com"> Products </a> </li>
                    <li> <a href="http://indiasimprovement.com"> Services </a></li>
                    <li> <a href="http://indiasimprovement.com">Contact Me </a> </li>
                </ul>
            </nav>
            <section id="main_content">
                <article id="main_article">
                    <form name="cart" action="Controller" method="Post">
                        <select name="Item">
                            <option value="books"> Books </option>
                            <option value="electronics"> Electronics </option>
                            <option value="icecream"> House Hold Stuffs</option>
                        </select>
                        <input type="submit" value="product" name="product">
                    </form>
                    <% if (productname != null) {%> <form name="cart_details" method="Post" action="Controller">
                        
                            <span id="add_to_cart"> <input type="submit" value="Add to Cart" name="cartdetails"> </span>
                                <%        for (int i = 1; i <= productname.size(); i++) {
                                %> 
                           
                            <article id="inner_article">                      
                                 <table cellspacing="0" cellpadding="0">
                                <br> 
                                <tr><td id="table_data"> <%= i%> . 
                                    <span id="inner_artcile_heading" > <%= productname.get(i - 1)%> </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </td></tr>
                                <span id="quantity"> Qty <input type="text" name="" value="" size="1"> </span> <br>
                                <tr><td id="table_data"> by 
                                    <span id="inner_artcile_dealer"> <%= brandname.get(i - 1)%> </span> <br> </td></tr>
                               <tr><td id="table_data"> <%= productdescription.get(i - 1)%> <br>  </td></tr>
                               <tr><td id="table_data"> Price: $<%= productprice.get(i - 1)%> <br>  </td></tr>
                               </table>
                            </article>
 
                            <%                          
                           }%>
                       <% // mycart.setProduct_name(productname); out.println("my cart details from below= " + mycart.getProduct_name());                            
                            //mycart.setProduct_brand(brandname);
//                            mycart.setProduct_description(productdescription);
//                            mycart.setProduct_price(productprice);
//                            System.out.println("my cart details from below= " + mycart.getProduct_name());
//                            System.out.println("my cart details from below= " + mycart.getProduct_brand());
//                            System.out.println("my cart details from below= " + mycart.getProduct_description());
//                            System.out.println("my cart details from below= " + mycart.getProduct_price());
                        }%> 
                            
                            
                    </form>
                    


                </article>
               <footer  class="text-center">
            <div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
        <strong>Copyright &copy; 2015 <a>Team 3</a>.</strong> All rights reserved.
      </div>
    </footer>
        </div>
    </body>
</html>
