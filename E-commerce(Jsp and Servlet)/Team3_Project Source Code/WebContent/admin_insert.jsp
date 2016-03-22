<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="mycss.css" type="text/css" >
         <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/dbStyle.css">
        <link href="font-awesome-4.4.0/css/font-awesome.css" rel="stylesheet">
    </head>
    <body>

        <% String classifier_name = "none";
            session.setAttribute("admin_mode", "insert");
            String db_insertion_result = (String) session.getAttribute("db_insertion_result");
            //out.println("Admin mode = " + (String) session.getAttribute("admin_mode"));
            //out.println("insertion_result " + db_insertion_result);
            if ((String) session.getAttribute("classifier_name") != null) {
                classifier_name = (String) session.getAttribute("classifier_name");
                //out.println("Classifier name selected = " + classifier_name);                
            }%>       

            <div class="container text-center">
            <h2> Welcome Admin!! </h2>
            </div>
             <br /> <br />
             
            <form name="admin" action="Controller" method="post">
                 <div class="logmeout">
                  <input type="submit" name="signout" class="btn btn-default" value=" Logout "> </div>
                <nav id="links"> 
                    <ul>                                             
                         
                        <li> <a href="admin_update.jsp" title="Update" > <i class="fa fa-pencil-square  fa-2x"></i>  </a> </li>
                        <li> <a href="admin_remove.jsp" title="Delete" > <i class="fa fa-trash-o  fa-2x "></i> </a> </li>                    
                         <li> <a href="admin_insert.jsp" title="Insert" > <i class="fa fa-plus-circle  fa-4x"> </i>  </a> </li>
                        <li> <a href="admin_view_all.jsp" title="View" > <i class="fa fa-eye  fa-2x"></i>  </a> </li>             
                    </ul>
                </nav>
                <

iv class="container"> 
                <div class="row">
                  <div class="col-sm-4 col-sm-offset-4"  style="background-color: #ffffff;opacity:0.9;">       
                    <br />
                    <h3> Select a product to insert </h3>
                     <br />  <br />
                      
                     <% if(db_insertion_result!=null){if(db_insertion_result.equals("success")){%>
                     
                    <span style="color:green"> 
                     <b> Insertion Successful!!  </b>
                      </span> 
                      
                     <% } if(db_insertion_result.equals("failure")) { %>
                     <span style="color:red">
                      <b> Insertion Failure! Please try again!   </b> 
                      </span> 
                     <% }} %>
                     
                     <br /> <br />
                     <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
  <div class="form-group ">
<label class="control-label" for="">Select Item</label>
<select name="admin_classifer_choice" required>
                        <option value="------"> </option>
                        <option value="Books"> Books </option> 
                        <option value="Electronics"> Electronics </option>
                        <option value="Icecream"> Ice Cream </option> 
                    </select> 
                    <div class="help-block"></div>
                     <div class="form-group">
                            <button type="submit" value="Insert" name="admin_catagory" class="btn btn-default" >Insert</button>

                        </div>
                    
</div>
</div>
                    
                    
                     <br /> <br /> 
                    <div class="container"  id="admin_mode"> </div>
                    
                    <% if ((String) session.getAttribute("classifier_name") != null) {
                         classifier_name = (String) session.getAttribute("classifier_name");%>
                               
                    Catogory Selected : <span style="color:green">  <b> <%= classifier_name%> </b> </span>

                    <% }%>      <br /> <br />
                    <% if (classifier_name != null || classifier_name != "") {%>
                       
                       <label for="Name">Name:</label> 
                       <input type="text" class="form-control" name="admin_product_name"  required />
                       <label for="Author">Author/Store</label> 
                       <input type="text" class="form-control" name="admin_product_author_store_name" required />
                       <label for="Description">Description:</label> 
                       <input type="text" class="form-control" name="admin_product_description" required/>
                       <label for="Price">Price</label> 
                       <input type="text" class="form-control" name="admin_product_price" required />
                             <button type="submit" value="Insert" name="admin_db_changes" class="btn btn-default" >Insert</button>
                      
                    <% }%>
                </div>
                </div>
                </div>
                <br /> <br />
                <form>
                    
                      <footer  class="text-center">
            <div class="container col-lg-12 col-md-12 col-xs-12 no-padding"><br><br><br><br>
        <strong>Copyright &copy; 2015 <a>Team 3</a>.</strong> All rights reserved.
      </div>
    </footer>
                    </body>
                    </html>
