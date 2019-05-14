% rebase('base.tpl', title='Python')

<style>

input[type=text], input[type=password], input[type=date] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus, input[type=date]:focus {
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
  width: 95%;
}

hr{
    display: block;
    height: 1px;
    border: 0;
    border-top: 1px solid #ccc;
    margin: 1em 0;
    padding: 0;
}

.background-field{
	margin-bottom:0
}

</style>

<body>
<div class="jumbotron background-field">
<form action="/welcome" method='post'>
  <div class="container">
    <h1>Sign Up</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>

    <label for="name"><b>Name</b></label>
    <input type="text" placeholder="Enter Your Name" name="name" required>

    <label for="surname"><b>Surname</b></label>
    <input type="text" placeholder="Enter Your Surname" name="surname" required>
    <label for="gender"><b>Gender</b></label>
  </br>

    <div class="form-check-inline">
      <label class="form-check-label">
        <input type="radio" class="form-check-input" name="gender" value="female">Female
      </label>
    </div>
    <div class="form-check-inline">
      <label class="form-check-label">
        <input type="radio" class="form-check-input" name="gender"  value="male">Male
      </label>
    </div>

	</br></br>

    <label for="birthdate"><b>Birthday</b></label>
  </br>
       <input class="form-control" type="date" value="2011-08-19" name='date' id="example-date-input">

    </br>

    <label for="login"><b>Login</b></label>
    <input type="text" placeholder="Enter Login" name="login" required>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>

    <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

	    <div class="clearfix">
		    <div class='column'>
		        <button type="submit" class="btn btn-secondary">Sign Up</button>
		    </div>
			<div class='column'>
		        <a onclick="window.location='/';return false;"><button class="btn btn-secondary">Cancel</button></a>



		    </div>
	    </div>
</div>
</form>
</body>
