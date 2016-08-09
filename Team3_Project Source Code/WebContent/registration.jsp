

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to India's Improvement Registration Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/dbStyle.css">
        
    </head>
    <body>
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
    
            <div class="container">
                <div class="row">
                    <div id="registration_block" class="col-sm-4 col-sm-offset-4"  style="background-color: #ffffff;opacity:0.9;">  
                        <h3 align="center">Registration Page</h3>
                            <form  action="Controller" method="Post">
                       <div class="form-group">
                            <label for="userName">Username:</label> 
                            <input type="text" class="form-control" name="registration_username" required/>
                            <label for="password">Password:</label> 
                            <input type="password" class="form-control" name="registration_password" required />
                        </div>
                        
                        <div class="form-group">
                            <button type="submit" value="Register" name="registration_submit" class="btn btn-default " >Register</button>
                            <button type="reset" value="Reset" class="btn btn-default " >Reset</button>


                            <a href="./index.jsp"
                                class="btn btn-default">Back</a>
                        </div>
                    </form>
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
