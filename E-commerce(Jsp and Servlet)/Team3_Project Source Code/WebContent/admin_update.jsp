
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
        String admin_name = (String) session.getAttribute("name");
            session.setAttribute("admin_mode", "update");
            String db_update_result = (String) session.getAttribute("db_update_result");
         //   out.println("Admin mode = " + (String) session.getAttribute("admin_mode"));
         //   out.println("insertion_result " + db_update_result);
            if ((String) session.getAttribute("classifier_name") != null) {
                classifier_name = (String) session.getAttribute("classifier_name");
          //      out.println("Classifier name selected = " + classifier_name);
            }%>

			

            <div class="container text-center"><h2> Namaste <%= admin_name %> </h2>
            </div> <br /> <br />
            <form name="admin" action="Controller" method="post">
                 <div class="logmeout"> <input type="submit" name="signout" value=" Logout "> </div>
                <nav id="links"> 
                    <ul>                        
                            
                        <li> <a href="admin_remove.jsp" title="Delete" > <i class="fa fa-trash-o  fa-2x "></i> </a> </li>                    
                         <li> <a href="admin_insert.jsp" title="Insert" > <i class="fa fa-plus-circle  fa-2x"> </i>  </a> </li>
                        <li> <a href="admin_update.jsp" title="Update" > <i class="fa fa-pencil-square  fa-4x"></i>  </a> </li>
                      
                        <li> <a href="admin_view_all.jsp" title="View" > <i class="fa fa-eye  fa-2x"></i>  </a> </li>             
                    </ul>
                </nav>
                <div class="container text-center"> 
                     <br /><h3> Select a product to update </h3> <br />  <br /> 
                         <% if(db_update_result!=null){if(db_update_result.equals("success")){%>
                     <span style="color:green">  <b> Update Successful!!  </b> </span> 
                     <% } if(db_update_result.equals("failure")) { %>
                     <span style="color:red">  <b> Update Failure! Please try again!   </b> </span> 
                     <% }} %>
                     <br /> <br />
                    <select name="admin_classifer_choice">
                        <option value=""> </option>
                        <option value="Books"> Books </option> 
                        <option value="Electronics"> Electronics </option>
                        <option value="Icecream"> Ice Cream </option> 
                    </select> 
                    <input type="submit"  value =" > " name="admin_catagory" /> <br /> <br /> 
                    <div id="admin_mode"> </div>
                    <% if ((String) session.getAttribute("classifier_name") != null) {
                         classifier_name = (String) session.getAttribute("classifier_name");%>      
                    Catogory Selected : <span style="color:green">  <b> <%= classifier_name%> </b> </span>

                    <% }%>      <br /> <br />
                    <% if (classifier_name != null || classifier_name != "") {%>
                
                   <label for="Name">ID:</label> 
                       <input type="text" class="form-control" name="admin_product_id" required/>
                   <label for="Name">Name:</label> 
                       <input type="text" class="form-control" name="admin_product_name" required />
                     
                   <label for="Author">Author/Store</label> 
                       <input type="text" class="form-control" name="admin_product_author_store_name" required />
                       <label for="Description">Description:</label> 
                       <input type="text" class="form-control" name="admin_product_description" required />
                       <label for="Price">Price</label> 
                       <input type="text" class="form-control" name="admin_product_price"  required />
                             <button type="submit" value="Update" name="admin_db_changes" class="btn btn-default" >Update</button>
                    <% }%>
                </div>
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
