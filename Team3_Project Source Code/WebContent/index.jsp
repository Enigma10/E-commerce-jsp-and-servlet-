<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String name=(String) request.getAttribute("name");
String names=(String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Log in</title>
        <!-- CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/dbStyle.css">
        <link href="css/fullcalendar.print.css" rel="stylesheet" media="print">
<link href="css/jquery-ui.css" rel="stylesheet">
<link href="css/fullcalendar.css" rel="stylesheet">
<link href="css/AdminLTE.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="css/ionicons-2.0.1/css/ionicons.min.css" rel="stylesheet">
<link href="css/bootstrap-multiselect.css" rel="stylesheet">
<link href="css/EdusecCustome.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/yii.js"></script>
<script src="js/AdminLTE/app.js"></script>
<script src="js/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="js/bootstrap-multiselect.js"></script>
<script src="js/custom-delete-confirm.js"></script>
<script src="js/bootbox.js"></script>
<script src="js/bootstrap.file-input.js"></script>
<script src="js/bootstrapx-clickover.js"></script>
<script src="js/custom-delete-confirm.js"></script>
        

        
</head>
    <body >
             <script type="text/javascript">
            function form_validation(){
            var name=document.Login_Form.login_name.value;
            var password=document.Login_Form.login_password.value;
            var flag = true;             
            if(name==""){
                document.getElementById("invalid_login").style.color="red";
                document.getElementById('invalid_login').innerHTML="UserName is mandatory!";
                flag = false;
            }             
            if(password==""){
                document.getElementById("invalid_login").style.color="red";
                document.getElementById('invalid_login').innerHTML="Password is mandatory!";
                flag = false;
            }    
            return flag;
            }
        </script>
   
   <div class="container" >
        <div class="navbar-top navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Team3 Sales System</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"></a></li>
                </div>
            </div>
        </div>

      
              
<div id="invalid_login"> </div>
        <% String authentication = (String) session.getAttribute("authentication");            
            if (authentication == null) {
        %>                
        
        <div id="login_in">
            <div class="container" >
                <div class="row">
                    <div id="login_block" class="col-sm-4 col-sm-offset-4"  style="background-color: #ffffff;opacity:0.9;">  
                        <h3 align="center">Log In</h3>
                            <form name="Login_Form" action="Controller" method="Post">
                       <div class="form-group">
                            <label for="userName">Username:</label> 
                            <input type="text" class="form-control" name="login_name" required />
                            <label for="password">Password:</label> 
                            <input type="password" class="form-control" name="login_password" required />
                        </div>
                        
                        <div class="form-group">
                            <button type="submit" value="submit" name="login_submit" class="btn btn-default" onclick="return form_validation()">Sign
                                in</button>

                            <a href="./registration.jsp"
                                class="btn btn-default">Register</a>
                        </div>
                    </form>
              </div>
 <% }
                if (authentication != null) { if(authentication.equals("Auth_Success"))
                { // out.println("authentication = " + authentication);
            %>
          
        <div id="user_info"> Swagatam  <span style="color:green">   <i> </i>  </span> </div>
            <form name="logout" action="Controller" method="Post">
                <div class="logmeout"> <input type="submit" class=" btn btn-default pull-right" name="signout" value=" Logout "> </div>
            </form>            
            <%} else { %>
            <div id="wrong_user"> <span style="color:red"> Username/Password is wrong! </span> </div>
      <form name="Login_Form" action="Controller" method="Post">
                       <div class="form-group">
                            <label for="userName">Username:</label> 
                            <input type="text" class="form-control" name="login_name" required />
                            <label for="password">Password:</label> 
                            <input type="password" class="form-control" name="login_password" required />
                        </div>
                        
                        <div class="form-group">
                            <button type="submit" value="submit" name="login_submit" class="btn btn-default" onclick="return form_validation()">Sign
                                in</button>

                            <a href="./registration.jsp"
                                class="btn btn-default">Register</a>
                        </div>
                    </form>
          
            <%}}%>



                </div>
            </div>
                        
        </div>
               
 
    </div>
        
    <footer class="text-center">
            <div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
        <strong>Copyright &copy; 2015 <a>Team 3</a>.</strong> All rights reserved.
      </div>
    </footer>
    </body>
</html>
