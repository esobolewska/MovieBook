<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="max-age=0" http-equiv="cache-control">
    <meta content="no-cache" http-equiv="cache-control">
    <meta content="0" http-equiv="expires">
    <meta content="Tue, 01 Jan 1980 1:00:00 GMT" http-equiv="expires">
    <meta content="no-cache" http-equiv="pragma">
    <title>MovieBook.com</title>


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <style>

    body {
      background-image:url("https://cdn3.vectorstock.com/i/1000x1000/36/37/movie-seamless-pattern-background-with-vector-13813637.jpg");
      background-color: #cccccc;
    }
        .jumbotron{
        	   background-color: c;
        	   color:black;
        	}
        	.tab-content {
        	   border-left: 1px solid #ddd;
        	   border-right: 1px solid #ddd;
        	   border-bottom: 1px solid #ddd;
        	   padding: 10px;
        	}
        	.nav-tabs {
        	   margin-bottom: 0;
        	}
          .navbar-brand{
            font-size:18px
          }
          .nav-link {
            color: #fff;
            font-size: 14px
          }
          .navbar {
            background-color: #FF851B;
            height:45px
          }
		  .text-center{
		  	background: rgba(0,0,0,0.3);
			color: white;
		  }
    </style>
</head>

<div style="margin:0; background: rgba(0,0,0,0.4); width:100%">
<center><div class="container" style="margin:0; padding:25px; width:100%">
  <h2 style="align: center; margin:0; color: white;">MovieBook.com</h2>
  <p style="align: center; margin:0; color: white;">Rate your favorite films now!</p>
</div></center>



<body>
<!-- MENU -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-sticky-top">

  <ul class="navbar-nav">

      <div class="navbar-header">
        <span class="navbar-brand" style='color:#ffffff'>MovieBook.com</span>
      </div>

      <li class="nav-item active">
        <a class="nav-link" href="/" style='color:#ffffff'>Main Page</a>
      </li>

      <li class="nav-item active">
        <a class="nav-link" href="/choose" style='color:#ffffff'>Choose</a>
      </li>
<% if loginName!=False: %>
      <li class="nav-item active">
        <a class="nav-link" href="/profile" style='color:#ffffff'>Profile</a>
      </li>
<%end%>
<% if loginName=="admin": %>
      <li class="nav-item active">
        <a class="nav-link" href="/admin" style='color:#ffffff'>Admin dashboard</a>
      </li>
<%end%>

    </ul>



     <ul class="nav navbar-nav flex-row justify-content-between ml-auto">
<% if loginName!=False: %>

      <li>
        <a class="nav-link disabled"  style='color:#ffe4cc'> You are logged in as: {{loginName}} </a>
      </li>

       <li>
         <a class="nav-link" href="/sign_out" style='color:#ffffff'>Log Out</a>
       </li>

<% elif  loginName==False: %>
      <li>
        <a class="nav-link" href="/register"> <b>Sign Up</b> </a>
      </li>

      <li>
        <a class="nav-link" href="/login"> <b>Log In</b> </a>
      </li>

%end
    </ul>


</nav>

<!-- PAGE CONTENTS -->
{{!base}}

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js">
    </script>

</body>
</div>

</html>
