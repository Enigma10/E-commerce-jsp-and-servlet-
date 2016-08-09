

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="mycss.css" type="text/css" /> 
          <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/dbStyle.css">
        <link href="font-awesome-4.4.0/css/font-awesome.css" rel="stylesheet">
 
    </head>
    <body bgcolor = "blue">        
        <form action="Controller" method="Post">                   
                <div class="logmeout"> <button class="btn btn-defalut pull-right" type="submit" name="signout" value=" Logout ">Log Out</button> </div>
        </form>
        <div class="container text-center">
            <% String Confirmation = (String) session.getAttribute("Order_Confirmation");
                if (Confirmation == null) {
            %>
<div class="container"> 
                <div class="row">
                  <div class="col-sm-4 col-sm-offset-4"  style="background-color: #ffffff;opacity:0.9;">   

            <form action="Controller" method="Post">                   
                <!--div class="logmeout"> <input type="submit" name="signout" value=" Logout "> </div-->
                <h2  for="Author"> Payment Information </h2> <br /> <br />
                <label for="Name">Card Type</label> 
                <select name="card_type" class="form-control" required>
                    <option> State Bank of India </option>   
                    <option> Citi Bank </option>   
                    <option> Disover </option>   
                    <option> Punjab National Bank </option>   
                </select>  
                <label for="Name">Card Number</label>                                         
                 <input type="number" value="" maxlength="16" class="form-control" name="card_number" required />
                 <label for="Name">Card Name</label> 
                 <input type="text" value="" maxlength="20" class="form-control" name="card_name"  required/>
                 <label for="Name">Expiration Date</label>  
                 <select name="expiration_month" class="form-control">
                    <option> 1 </option> <option> 2 </option> <option> 3 </option> <option> 4 </option>   
                    <option> 5 </option> <option> 6 </option> <option> 7 </option> <option> 8 </option>   
                    <option> 9 </option> <option> 10 </option> <option> 11 </option> <option> 12 </option>   
                </select>                      
                <select name="expiration_year" required>
                    <option> 2013 </option>   
                    <option> 2014 </option>   
                    <option> 2015 </option>   
                    <option> 2016 </option>   
                </select> <br />  <br /> 

  
                <h2> Billing Information </h2> <br /> <br /> 
                    <label for="Name">Full Name:</label> 
                       <input type="text" class="form-control" name="fullname" size = "8" required/>
                       <label for="Author">Address</label> 
                       <input type="text" class="form-control" name="adress" required/>
                       <label for="Description">Country:</label> 
                       <input type="text" class="form-control" name="country" required />
                       <label for="Price">zip</label> 
                       <input type="number" class="form-control" name="zipcode" required/>
                             <button type="submit" name="place_order" class="btn btn-default" >Order</button>
                   
              
                <% }  // ending billing n payment info %>
                <%
                    if (Confirmation != null) {
                %>

                <!--div class="logmeout"> <input type="submit" name="signout" value=" Logout "> </div-->

                <h1> Order Has been submitted!! Look out for your product!!!  <br /> <br /> <br /> 
                    Thank you for ordering at Team3 Sales System. </h1>  <br /> <br /> <br /> <br /> <br />
                <div id="link">    <h2> <a href="user_cart.jsp"> Shop Again! </a> </h2> </div>
                <% }%>

            </form>         
        </div>
        </div>
        </div>
        </div>
          <footer class="text-center">
            <div class="container col-lg-12 col-md-12 col-xs-12 no-padding"><br>
        <strong>Copyright &copy; 2015 <a>Team 3</a>.</strong> All rights reserved.
      </div>
    </footer>
    </body>
</html>
