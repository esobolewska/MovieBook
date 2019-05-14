% rebase('base.tpl', title='Python')

<style>

    input[type=text],
    input[type=password],
    input[type=date] {
        width: 100%;
        padding: 15px;
        margin: 5px 0 22px 0;
        display: inline-block;
        border: none;
        background: #f1f1f1;
    }

    input[type=text]:focus,
    input[type=password]:focus,
    input[type=date]:focus {
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
        width: 100px;
        opacity: 0.9;
    }

    button:hover {
        opacity: 1;
    }

    .cancelbtn {
        padding: 14px 20px;
        background-color: #f44336;
    }

    .cancelbtn,
    .signupbtn {
        float: left;
        width: 50%;
    }

    .container {
        padding: 16px;
    }

    .clearfix::after {
        content: "";
        clear: both;
        display: table;
    }

    @media screen and (max-width: 300px) {
        .cancelbtn,
        .signupbtn {
            width: 100%;
        }
    }

    .column {
        width: 50%;
        float: left;
    }

    .btn-secondary {
        width: 95%;
    }

    hr {
        display: block;
        height: 1px;
        border: 0;
        border-top: 1px solid #ccc;
        margin: 1em 0;
        padding: 0;
    }

    .background-field {
        margin-bottom: 0
    }

    textarea[type=text] {
        width: 100%;
        padding: 15px;
        margin: 5px 0 22px 0;
        display: inline-block;
        border: none;
        background: #f1f1f1;
    }

    textarea[type=text]:focus {
        background-color: #ddd;
        outline: none;
    }
</style>

<div class="jumbotron background-field">
    <div class="container">
        <h4><strong>Edit panel</strong></h4>
        <p class="lead">Here you can edit your profile.</p>
<hr>


        <div class='column'>
            <a href="/profile"><img src='https://image.flaticon.com/icons/svg/118/118744.svg' hspace=10 width=20 height=20 style="margin-bottom:3px">Back to profile</a>
        </div>

</br>
        </br>


        <body>

            <div class="container">

                <div class="row">
                    <div class="column">
                        <div class='col-sm-6'>

                            <img src="{{user_info[9]}}" height=150 width=150 alt="Card image">

                        </div>
                        </br>
                    </div>

                    <head>
                        <link href="upload_style.css" type="text/css" rel="stylesheet" />
                    </head>
                    <div class="column">
                        <div class='col-sm-10'>

                                        <form method="post">
                                            <input type="text" name="img_url" placeholder="Enter Avatar URL">
                                            <button class="btn btn-light" onClick="window.location.reload()" type="submit">Submit</button>
                                        </form>
                        </div>
                    </div>
                </div>

                  <form method="post">
                    <label for="name"><b>Name</b></label>
                    <input type="text" placeholder="{{user_info[1]}}" name="name">
                    <button class="btn btn-light" onClick="window.location.reload()" type="submit">Submit</button>
                  </form>
                  </br>

                    <form method="post">
                    <label for="surname"><b>Surname</b></label>
                    <input type="text" placeholder="{{user_info[2]}}" name="surname">
                    <button class="btn btn-light" onClick="window.location.reload()" type="submit">Submit</button>
                  </form>
                  </br>

                    <form method="post">
                    <label for="birthdate"><b>Birthday</b></label>
                  </br>
                    <input class="form-control" type="date" value="{{user_info[7]}}" name='date' id="example-date-input">
                    <button class="btn btn-light" onClick="window.location.reload()" type="submit">Submit</button>
                  </form>
                  </br>
</br>


                    <form method="post">
                    <label for="email"><b>Email</b></label>
                    <input type="text" placeholder="{{user_info[3]}}" name="email">
                    <button class="btn btn-light" onClick="window.location.reload()" type="submit">Submit</button>
                  </form>
                  </br>

                    <form method="post">
                    <label for="about"><b>About you</b></label>
                    <textarea type="text" placeholder="{{user_info[10]}}" name="about"></textarea>
                    <button class="btn btn-light" onClick="window.location.reload()" type="submit">Submit</button>
                  </form>
                  </br>




            </div>
            </form>
        </body>

    </div>
