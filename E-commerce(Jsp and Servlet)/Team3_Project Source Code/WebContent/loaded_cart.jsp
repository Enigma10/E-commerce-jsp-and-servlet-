
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.*" %>
<%@ page errorPage="error.jsp"%>
<% ArrayList itemname = new ArrayList();%>
<% ArrayList quantityno = new ArrayList();%>
 
<!DOCTYPE html>
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="mycss.css" type="text/css" >
         <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/dbStyle.css">
        <link href="font-awesome-4.4.0/css/font-awesome.css" rel="stylesheet">
    </head>  <body>

        <form name="logout" action="Controller" method="Post">
            <div class="logmeout"> <input type="submit" name="signout" value=" Logout "> </div>
        </form>         

        <div class="container">
            <center>

                <% itemname = (ArrayList) session.getAttribute("product_in_cart");
                    quantityno = (ArrayList) session.getAttribute("quantity_in_cart");%>
                <jsp:useBean id="product_in_cart" class="java.util.ArrayList" scope="session" ></jsp:useBean>
                <% //out.println("Product in cart = " + product_in_cart ); used a JSTL 
                        if (itemname != null) {%>
                <br />        
                <h1> Items in your cart </h1> <br /> 
        
      <div id="payment">
                <form action="Controller" method="Post">
                     
                    <div class="logmeout">
                     <input class="form-control pull-right" type="submit" name="signout" value="Log out"> </div>
                    <button type="submit" class="form-control pull-right" name="payment" value=" Payment "> Payment</button>
                </form>
            </div>
 <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                <table  class="table table-striped table-bordered">
                   <thead>
                    <tr>
                        <th> No. of items </th>
                        <th> Item Name </th>
                        <th> Quantity </th>
                    </tr>
                    </thead>            
                    <% for (int i = 1; i <= itemname.size(); i++) {%>
                   <tbody>
                    <tr>
                        <td> <%=i%> </td>
                        <td>  <%= itemname.get(i - 1)%>   </td>
                        <td> <%= quantityno.get(i - 1)%> </td>              
                    </tr>
                    </tbody>
                    <%}%>
                </table>
                <%}%>   
                <%  if (itemname == null) {%>
                
                <h1> There are no items in your cart now.. Please add items to your cart first!! </h1>
                <%}%>
 </div>       </div>
    <footer  class="text-center">
            <div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
        <strong>Copyright &copy; 2015 <a>Team 3</a>.</strong> All rights reserved.
      </div>
    </footer>
    </body>

</html>
