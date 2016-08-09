<%@page import="com.util.CartDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.util.ProductDetails" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.HashMap" %>
<%@page import="com.util.Query" %>
<%
    response.setHeader("Cache-Control", "no-store"); //when you hit back, it displays "Confirm page Submission"
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!--%! String ifnull(String s){          You could use this, if the String ever goes null
    return (s==null)?\"\":s;
}
%-->
<%@ page errorPage="error.jsp"%>

<%!  ProductDetails pro = new ProductDetails();  //instantiating ProductDetails class and calling the getter mthods.
    CartDetails mycart = new CartDetails();
    ProductDetails sessionbean = new ProductDetails();  //need to remove 
    String name = null;
    //name = (String) request.getAttribute("name");  // very much needed line. use setters and getters instead of this.
    ArrayList productname = new ArrayList();
    ArrayList productdescription = new ArrayList();
    ArrayList brandname = new ArrayList();
    ArrayList productprice = new ArrayList();
    Query queryObject = new Query();
    //ProductDetails productdetailsObject = queryObject.getProductDetails();   need to comment it if you need to get the object from..

    //getAttribute and setAttribute always works
%>
<%
    productname = (ArrayList) session.getAttribute("productname");
    productdescription = (ArrayList) session.getAttribute("productdescription");
    brandname = (ArrayList) session.getAttribute("brandname");
    productprice = (ArrayList) session.getAttribute("productprice");
    System.out.println("Product DESCRIPTION SET IN USER CART.JSP");
    sessionbean.setProduct_description(productdescription);
//    out.println("productdetailsObject values name = " + productdetailsObject.getProduct_name());  
//    out.println("productdetailsObject values name = " + productdetailsObject.getProduct_description());
//    out.println("productdetailsObject values name = " + productdetailsObject.getProduct_price());
//    out.println("productdetailsObject values name = " + productdetailsObject.getProduct_brand());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mycss.css">
         <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/dbStyle.css">
        <link href="font-awesome-4.4.0/css/font-awesome.css" rel="stylesheet">
        <title>Home Page</title>
    </head>
    <body>
        <script type="text/javascript">
        
            function changeImage()
            {
                element=document.getElementById('myimage');
                
                //                itemid=document.getElementbyId('myimage');
                //                alert(itemid.id);
                
                if (element.src.match("Images/image_3.gif"))
                {
                    element.src="Images/image_1.jpg";
                }
                else if(element.src.match("Images/image_1.jpg"))
                {
                    element.src="Images/image_2.jpg";
                }
                else 
                {
                    element.src="Images/image_3.gif";
                }
            }    
        </script>
        <% String authentication = (String) session.getAttribute("authentication");
            if (authentication == null) {
        %>
        <!--jsp:useBean id="name" scope="session" class="com.util.Controller"--><!--/jsp:useBean-->   
             
        <div id="login_in">
            <form name="Home_Page" action="Controller" method="Post">
                <div class="container pull-right">                       
                    <div class="form-group">
                            <label for="userName">Username:</label> 
                            <input type="text" class="form-control" name="login_name" />
                            <label for="password">Password:</label> 
                            <input type="password" class="form-control" name="login_password" />
                             <button type="submit" value="submit" name="login_submit" class="btn btn-default" onclick="return form_validation()">Sign
                                in</button>

                            <a href="./registration.jsp"
                                class="btn btn-default">Register</a>
                        </div>
                                    
                   
                </div>                    
            </form>
            <% }
                if (authentication != null) {
                    if (authentication.equals("Auth_Success")) {
            %>
            <div id="user_info"> Swagatam  <%= (session.getAttribute("name"))%> <span style="color:green">   <i> <!--%= name %-->! </i>  </span> </div>

            <form name="logout" action="Controller" method="Post">

                
                 <input class="form-group btn btn-default pull-right" type="submit" name="signout" value=" Logout "> 
             </form>         
            <%} else {%>
            <div id="wrong_user"> <span style="color:red"> Username/Password is wrong! </span> </div>
            <form name="Home_Page" action="Controller" method="Post">
                <div id="login_in" >                       
                   <div class="container pull-right">                       
                    <div class="form-group">
                            <label for="userName">Username:</label> 
                            <input type="text" class="form-control" name="login_name" />
                            <label for="password">Password:</label> 
                            <input type="password" class="form-control" name="login_password" />
                             <button type="submit" value="submit" name="login_submit" class="btn btn-default" onclick="return form_validation()">Sign
                                in</button>

                            <a href="./registration.jsp"
                                class="btn btn-default">Register</a>
                        </div>
                                    
                   
                </div> 
                </div>                    
            </form>

            <%}
                }%>

        </div>  
                  <div class="page-header">
            <nav id="links"> 
                <ul>
                    <li> <a href="#"> Home </a> </li>
                    <li> <a href="seller.jsp"> Add Your Product </a> </li>
                    <li> <a href="about_us.jsp"> About Us </a></li>
                    <li> <a href="contact_us.jsp">Contact Me </a> </li>
                </ul>
                
            </nav>
            </div>
            <div class="container">
                <div class="row-fluid">

<div class="container">
                <div class="row-fluid">
                    <form name="cart" action="Controller" method="Post">
                        <select name="Item">
                            <option value="books"> Books </option>
                            <option value="electronics"> Electronics </option>
                            <option value="icecream"> Ice Cream </option>
                        </select>
                        <button type="submit" class="btn btn-default"value="product" name="product">Product</button>
                    </form>
<div class="container text-center">
                    <% if (session.getAttribute("total_cart_items") != null) {%>
                    <span id="total_cart_items"> Total items in cart = <%= session.getAttribute("total_cart_items")%></span>
                    <% }%>
</div>
                    <% if (productname != null) {%> <form name="cart_details" method="Post" action="Controller">                         
                        <span > <button type="submit" class="btn btn-default" value="Add to Cart" name="cartdetails"> Add To Cart</button></span>
                        <span > <button type="submit" class="btn btn-default" value="finish n checkout" name="checkout_cart"> Finish & Checkout</button> </span>    
                            <%        for (int i = 1; i <= productname.size(); i++) {
                            %> 

<div class="container">
                <div class="row-fluid">
                        
                        <div class="span2 well"> 
                           <table class="table table-striped table-bordered">
                                <br /> 
                                <tr><td > <%= i%> . 
                                        <img id="myimage"  onclick="changeImage()" border="0" src="Images/image_3.gif" width="75" height="75" alt="Loading..">
                                        <span id="inner_artcile_heading" > <%= productname.get(i - 1)%> </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </td></tr>
                                <span id="quantity"> Qty <input type="text" name="quantity" value="" size="1"> </span> <br>
                                <tr><td id="table_data"> by 
                                        <span id="inner_artcile_dealer"> <%= brandname.get(i - 1)%> </span> <br> </td></tr>
                                <tr><td > <%= productdescription.get(i - 1)%> <br>  </td></tr>
                                <tr><td > Price: Rs<%= productprice.get(i - 1)%> <br>  </td></tr>                                
                            </table>
                        </div>
</div>
</div>
                        <%
                            }%>
                        <% session.setAttribute("product_name", productname);
                            }%>                            

                    </form>  
                </div>
                </div>            
            </div>
</div>

               <footer  class="text-center">
            <div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
        <strong>Copyright &copy; 2015 <a>Team 3</a>.</strong> All rights reserved.
      </div>
    </footer>
 

        </div>
    </body>
</html>
