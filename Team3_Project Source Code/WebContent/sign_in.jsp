<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://getbootstrap.com/favicon.ico">

    <title>Team-03</title>

    <!-- Bootstrap core CSS -->
    <link href="Signin%20Template%20for%20Bootstrap_files/bootstrap.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="Signin%20Template%20for%20Bootstrap_files/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="Signin%20Template%20for%20Bootstrap_files/signin.css" rel="stylesheet">
    <script src="Signin%20Template%20for%20Bootstrap_files/ie-emulation-modes-warning.js"></script>


<link href="Signin%20Template%20for%20Bootstrap_files/jquery-ui.css" rel="stylesheet">
<link href="Signin%20Template%20for%20Bootstrap_files/bootstrap.css" rel="stylesheet">
<link href="Signin%20Template%20for%20Bootstrap_files/AdminLTE.css" rel="stylesheet">
<link href="Signin%20Template%20for%20Bootstrap_files/font-awesome.css" rel="stylesheet">
<link href="Signin%20Template%20for%20Bootstrap_files/ionicons.css" rel="stylesheet">
<link href="Signin%20Template%20for%20Bootstrap_files/bootstrap-multiselect.css" rel="stylesheet">
<script src="Add%20Student_files/jquery.js"></script>
<script src="Add%20Student_files/yii.js"></script>
<script src="Signin%20Template%20for%20Bootstrap_files/bootstrap.js"></script>
<script src="Add%20Student_files/app.js"></script>
<script src="Add%20Student_files/jquery_002.js"></script>
<script src="Signin%20Template%20for%20Bootstrap_files/bootstrap-multiselect.js"></script>
<script src="Add%20Student_files/custom-delete-confirm.js"></script>
<script src="Signin%20Template%20for%20Bootstrap_files/bootbox.js"></script>
<script src="Signin%20Template%20for%20Bootstrap_files/bootstrap_002.js"></script>
<script src="Signin%20Template%20for%20Bootstrap_files/bootstrapx-clickover.js"></script>   

<script>
function validate(){

var a1 = getElementById("name").value;
var a2 = getElementById("organisation").value;
var a3 = getElementById("email").value;
var a4 = getElementById("password").value;

if (a1 == "" || a1.trim == "" || a1 == null){
alert("please enter organisation name ");
}

else if (a2 == "" || a2.trim == "" || a2 == null){
alert("please enter location");
}
else if (a3 == "" || a3.trim == "" || a3 == null){
alert("please enter email");
}
}
</script>
  </head>
  <body background="a.jpg">


 <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Team - 03</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                <li>
                        <a href="user_cart.jsp">Home</a>
                    </li>
                    <li>
                        <a href="about_us.jsp">About Us</a>
                    </li>
                    <li>
                        <a href="service.html">Provide Services</a>
                    </li>
                    <li>
                        <a href="contact_us.jsp">Contact Us </a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>



    <div class="container">
 <marquee><b style="color:white;"><h3>Welcome to Online Business Relationship Management, Connect to us and be one of us.We welcome all new suppliers </h3></b></marquee>
      <form class="form-signin">

       <b style="color:dark blue;"> <h2 class="form-signin-heading">Please Register</h2></b>
                <input id="name" class="form-control" placeholder="Organisation name" type="text" required>
		<input id="organisation" class="form-control" placeholder="Organisation Location" type="text" required>
        
        <input id="email" class="form-control" placeholder="Email address" type="email" required>
        
        <input id="password" class="form-control" placeholder="Password"  type="password" required>
       
        <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
      
</div></div>

</form>
    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="Signin%20Template%20for%20Bootstrap_files/ie10-viewport-bug-workaround.js"></script>
  

</body></html>
