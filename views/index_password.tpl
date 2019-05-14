% rebase('base.tpl', title='Python')

<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

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

@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}

</style>



<div class="jumbotron background-field" style="margin-bottom: 0; padding-bottom: 78px">
    <div class="container">
        <h4><strong>Password change panel</strong></h4>
        <p class="lead">Here you can change your password.</p>
<hr>


        <div class='column'>
            <a href="/profile"><img src='https://image.flaticon.com/icons/svg/118/118744.svg' hspace=10 width=20 height=20 style="margin-bottom:3px">Back to profile</a>
        </div>

</br>
        </br>

        <body>

              <% if passinfo!='':%>
              <div class="container">
                <img src='https://image.flaticon.com/icons/svg/196/196759.svg' hspace=10 width=30 height=30 style="margin-bottom:3px">
              <b>{{passinfo}}</b>
            </div>
            <hr>
              <%end%>



<div class="container">
                  <form method="post">
                    <label for="name"><b>Input old password</b></label>
                    </br>
                    <input type="password" name="psw0"  placeholder='Input old password'>

                  </br></br>


                    <label for="surname"><b>Input new password</b></label>
                    </br>
                    <input type="password" name="psw1" placeholder='Input new password'>
                    </br></br>

                    <label for="surname"><b>Repeat new password</b></label>
                    </br>
                    <input type="password" name="psw2" placeholder='Repeat new password'>
                    </br></br>

                    <button class="btn btn-light" onClick="window.location.reload()" type="submit" style="width:200px">Submit</button>
                  </form>
                  </br>
              </div>

        </body>

    </div>
