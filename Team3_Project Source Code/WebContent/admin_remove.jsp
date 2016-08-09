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
            session.setAttribute("admin_mode", "remove");
            String db_deletion_result = (String) session.getAttribute("db_deletion_result");
         //   out.println("Admin mode = " + (String) session.getAttribute("admin_mode"));
         //   out.println("db_deletion_result = " + db_deletion_result);
            if ((String) session.getAttribute("classifier_name") != null) {
                classifier_name = (String) session.getAttribute("classifier_name");
            //    out.println("Classifier name selected = " + classifier_name);
            }%>


           <div class="container text-center">     
            <h2> Welcome Admin!! </h2></center> <br /> <br />
            <form name="admin" action="Controller" method="post">
                 <div class="logmeout"> <input type="submit" name="signout"  class="btn btn-default" value=" Logout "> </div>
                <nav id="links"> 
                    <ul>                        
                        <li> <a href="admin_update.jsp" title="Update" > <i class="fa fa-pencil-square  fa-2x"></i>  </a> </li>
                         <li> <a href="admin_insert.jsp" title="Insert" > <i class="fa fa-plus-circle  fa-2x"> </i>  </a> </li>
                        <li> <a href="admin_remove.jsp" title="Delete" > <i class="fa fa-trash-o  fa-4x "></i> </a> </li>                    
       
                        <li> <a href="admin_view_all.jsp" title="View" > <i class="fa fa-eye  fa-2x"></i>  </a> </li>             
            </ul>
                </nav>
                 <div class="container"> 
                <div class="row">
                       
               
                     <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
                 
                     <br /><h3> Select a product to remove </h3> <br />  
                    <% if(db_deletion_result!=null){if(db_deletion_result.equals("success")){%>
                     <span style="color:green">  <b> Deletion Successful!!  </b> </span> 
                     <% } if(db_deletion_result.equals("failure")) { %>
                     <span style="color:red">  <b> Deletion Failure! Please try again!   </b> </span> 
                     <% }} %>
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
                            <button type="submit" value="Delete" name="admin_catagory" class="btn btn-default" >Delete</button>

                        </div>
                    
</div>
</div>
                     
                    <div id="admin_mode"> </div>
                    <% if ((String) session.getAttribute("classifier_name") != null) {
                         classifier_name = (String) session.getAttribute("classifier_name");%>      
                    Catogory Selected : <span style="color:green">  <b> <%= classifier_name%> </b> </span>

                    <% }%>      <br /> <br />
                    <% if (classifier_name != null || classifier_name != "") {%>
                    <div class="container">
                    <label> Product ID<input class="radio" type="radio"  name="admin_radio_delete" value="id" required></label><br/>
                    
                    <label>Product Name<input class="radio" type="radio"  name="admin_radio_delete" value="name" required> </label><br/>
                    <label>Id/Name <input type="text" name="admin_id_or_name" required/></label>
                    <button type="submit" value="  Delete  " class="btn btn-default" name="admin_db_delete"> Delete</button> <br/>
                    </div>
                    <% }%>
               </div>
               </div>
                    </div>
                    </div>
                
                <br /> <br />
                <form>
                      <footer class="text-center">
            <div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
        <strong>Copyright &copy; 2015 <a>Team 3</a>.</strong> All rights reserved.
      </div>
    </footer>
                  
                    </body>
                    </html>
