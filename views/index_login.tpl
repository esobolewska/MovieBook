% rebase('base.tpl', title='Python')
<style>

input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}

.column{
  width: 50%;
  float: left;
}

.btn-secondary{
  width: 25%;

}


</style>
<div class="jumbotron background-field" style="margin-bottom: 0; padding-bottom:209px; padding-top:200px">

<form action="/login" method="post" style="margin-bottom: 0">
	<div class="container" style="margin-bottom: 0">

		<h1>Log in</h1>
    <p>Please fill in this form to log in.</p>
    <hr>

	<label for="login_name"><b>Login</b></label>
	<input type="text" placeholder="Enter Login" name="login_name"  class='myinput' required>

	<label for="password"><b>Password</b></label>
	<input type="password" placeholder="Enter Password" name="password" required>
	<button class='btn btn-secondary' type="submit" value="Zaloguj">Log In</button>

	</div>
</form>
</div>
