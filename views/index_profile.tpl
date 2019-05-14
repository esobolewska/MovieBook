% rebase('base.tpl', title='Python')

<style>
    .background-field {
        margin-bottom: 0
    }

    input[type=text],
    input[type=password] {
        width: 100%;
        padding: 15px;
        margin: 5px 0 22px 0;
        display: inline-block;
        border: none;
        background: #f1f1f1;
    }

    input[type=text]:focus,
    input[type=password]:focus {
        background-color: #ddd;
        outline: none;
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

<div class="jumbotron background-field" style="margin-bottom: 0; padding-bottom:50px">
    <div class="container">
        <h4>Welcome to your profile!</h4>
        <p class="lead">Here you can edit your personal information, username and password and also review rated movies. Start exploring!</p>

        <hr>
        </br>
    </div>
<div class="container">
<div class="card-deck">
        <div class="row">
            <div class="column">
                <div class="card" style="width:300px">
                    </br>
                    <img class="card-img-top" style="width: 150px; height:150px;  display: block; margin-left: auto;margin-right: auto;" src="{{userinfo[9]}}" alt="Card image">
                    <div class="card-body">

                        <center>
                            <h5 class="card-title">{{userinfo[4]}}</h5></center>
                            <p style="font-size:90%;"> {{userinfo[10]}}</p>
                        </br>

                        <head>
                            <meta charset="utf-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1">
                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
                            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
                        </head>


                    </div>
                      <center><a href='/profile/edit' class="btn btn-light" style="width:200px">More info</a>
                      <a href='/password-change' class="btn btn-light" style="width:200px">Change password</a></center>

                    </br>

                    </br>
                    <%if len(popularfilmlist)>0 and loginName!='test':%>
                    <div class='container'>
                    <center><h5 class="card-title">Popular movies to rate:</h5></center>
                  </br>
                  <ol>
                    <% for i in range(0,len(popularfilmlist)):%>
                    <li>
                    <a href="film/{{popularfilmlist[i][3]}}">
                    {{popularfilmlist[i][0]}} ({{popularfilmlist[i][4]}})
                    </a>
                    </li>

                    <%end%>
                  </ol>
                </div>
                    <%else:%>
                    <center><img src='https://image.flaticon.com/icons/svg/1356/1356496.svg' vspace=20 width=50 height=50>
                    <h5 class="card-title">Congratulations, you rated all movies!:</h5></center>
                    <%end%>
                  </br></br></br>

                </div>
            </div>


            <div class="card" style="width:900px; padding-bottom:50px">
                </br>

                <div class="column" style="margin-bottom: 0">

                  <div class="card-body">

                  <% if len(joined)>0:%>


  <a href='/profile/reviews' class="btn btn-light">See all reviews <img src='https://image.flaticon.com/icons/svg/53/53579.svg' hspace=10 width=20 height=20 style="margin-bottom:3px"></a>
  <hr>

                      <h5 class="card-title"><strong>Recent activity</strong></h5>



                  <% for i in range(len(joined)-1,-1,-1):%>

                            <div class="row">
                                <div class="col-md-3">
                                    <img src='{{joined[i][8]}}' class="w-60 " align="middle">
                                </div>
                                <div class="col-md-9">
                                <p class="card-text">
                                    <strong>Movie:</strong> {{joined[i][7]}} ({{joined[i][9]}})</br>
                                    <strong>Rating:</strong> {{joined[i][3]}} star(s)</br>
                                    <strong>Opinion:</strong> {{joined[i][2]}}</br>
                                    <strong>Date added:</strong> {{joined[i][4]}}</br>

                                </p>


                              </div>
                            </div>

  <hr>
                        <%end%>

  <a href='/profile/reviews' class="btn btn-light">See all reviews <img src='https://image.flaticon.com/icons/svg/53/53579.svg' hspace=10 width=20 height=20 style="margin-bottom:3px"></a>

                        <%else:%>
<div class='container'>
                        <h5 class="card-title"><strong>You have no reviews yet.</strong></h5>
                        <p>Here we will show most recent reviews that you have submitted. In order to add reviews click the link below:</p>
                        <a href='/choose' class="btn btn-light">Find movie to review <img src='https://image.flaticon.com/icons/svg/53/53579.svg' hspace=10 width=20 height=20 style="margin-bottom:3px"></a>
</div>
                        <%end%>



</div>
                </div>
            </div>
</div>
        </div>
    </div>

</div>
