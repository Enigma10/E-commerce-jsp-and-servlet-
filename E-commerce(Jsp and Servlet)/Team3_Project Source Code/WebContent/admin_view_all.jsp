
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="mycss.css" type="text/css" >
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/dbStyle.css">
        <link href="font-awesome-4.4.0/css/font-awesome.css" rel="stylesheet">
        <style type="text/css">
            #table_header{                
                background-color: orange;
                color:white;
            }
        </style>
    </head>
    <body>
        <%! ArrayList productname = new ArrayList();
            ArrayList productdescription = new ArrayList();
            ArrayList brandname = new ArrayList();
            ArrayList productprice = new ArrayList();
            ArrayList productid = new ArrayList();
        %>
        <%
            productname = (ArrayList) session.getAttribute("productname");
            productdescription = (ArrayList) session.getAttribute("productdescription");
            brandname = (ArrayList) session.getAttribute("brandname");
            productprice = (ArrayList) session.getAttribute("productprice");
            productid = (ArrayList) session.getAttribute("productid");
            System.out.println("productname = " + productname);
            System.out.println("productdescription = " + productdescription);
            System.out.println("brandname = " + brandname);
            System.out.println("productprice = " + productprice);
            System.out.println("productid = " + productid);            
        %>



        <% String classifier_name = "none";
            session.setAttribute("admin_mode", "view");
            String db_insertion_result = (String) session.getAttribute("db_insertion_result");
        //    out.println("Admin mode = " + (String) session.getAttribute("admin_mode"));
        //    out.println("insertion_result " + db_insertion_result);
            if ((String) session.getAttribute("classifier_name") != null) {
                classifier_name = (String) session.getAttribute("classifier_name");
               // out.println("Classifier name selected = " + classifier_name);
            }%>       
        
                   
            <div class="logmeout"> <input type="submit" name="signout" value=" Logout "> </div>
<div class="container text-center">       
<h2> Namaste Admin!! </h2>
</div>
 <br /> <br />
            <form name="admin" action="Controller" method="post">
                <nav id="links"> 
                    <ul>                                             
                        <li> <a href="admin_remove.jsp" title="Delete" > <i class="fa fa-trash-o  fa-2x "></i> </a> </li>                    
                         <li> <a href="admin_insert.jsp" title="Insert" > <i class="fa fa-plus-circle  fa-2x"> </i>  </a> </li>
                         
                        <li> <a href="admin_view_all.jsp" title="View" > <i class="fa fa-eye  fa-4x"></i>  </a> </li>             
                   <li> <a href="admin_update.jsp" title="Update" > <i class="fa fa-pencil-square  fa-2x"></i>  </a> </li>
     
                    </ul>
                </nav>
                
                <div class="" >      <br /><h3> Select a product to view </h3> <br />  <br /> 
                    <% if (db_insertion_result != null) {
                            if (db_insertion_result.equals("success")) {%>
                    <span style="color:green">  <b> Insertion Successful!!  </b> </span> 
                    <% }
                        if (db_insertion_result.equals("failure")) {%>
                    <span style="color:red">  <b> Insertion Failure! Please try again!   </b> </span> 
                    <% }
                        }%>
                    <br /> <br />
                          <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
  <div class="form-group ">
<label class="control-label" for="">Select Item</label>
<select name="admin_classifer_choice">
                        <option value="------"> </option>
                        <option value="Books"> Books </option> 
                        <option value="Electronics"> Electronics </option>
                        <option value="Icecream"> Ice Cream </option> 
                    </select> 
                    <div class="help-block"></div>
                     <div class="form-group">
                            <button type="submit" value="Insert" name="admin_view_all_products" class="btn btn-default" >View All</button>

                        </div>
                    
</div>
</div>
                    
                    
                    <% if ((String) session.getAttribute("classifier_name") != null) {
                            classifier_name = (String) session.getAttribute("classifier_name");%>      
                    Catogory Selected : <span style="color:green">  <b> <%= classifier_name%> </b> </span>

                    <% }%>      <br /> <br />
                    <% if (productname != null) {%> 
                    <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                          <th> Item Id </th>
                            <th> Product Name </th>
                            <th> Brand/Author Name</th>
                            <th> Description </th>
                            <th> Price </th> 
                        
                        </tr>
                        </thead>

                        <%        for (int i = 1; i <= productname.size(); i++) {
                        %>
                        <tbody>  
                        <tr>
                            <td> <%= productid.get(i - 1)%> </td> 
                            <td> <%= productname.get(i - 1)%>        </td>                                
                            <td> <%= brandname.get(i - 1)%>          </td>
                            <td> <%= productdescription.get(i - 1)%> </td>
                            <td> <%= productprice.get(i - 1)%>       </td>
                        </tr> 
                        </tbody>                   
                        <%
                        }%>
                    </table>
                    <% }%> 
                </center>
                <br /> <br />
                <form>
                    </div>
                      <footer class="text-center">
            <div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
        <strong>Copyright &copy; 2015 <a>Team 3</a>.</strong> All rights reserved.
      </div>
    </footer>
                    </body>
                    </html>




