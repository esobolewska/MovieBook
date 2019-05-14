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


    .rating {
          float:left;
        }

      .rating:not(:checked) > input {
          position:absolute;
          top:-9999px;
          clip:rect(0,0,0,0);
      }

      .rating:not(:checked) > label {
          float:right;
          width:1em;
          overflow:hidden;
          white-space:nowrap;
          cursor:pointer;
          font-size:300%;
          color:#ddd;
      }

      .rating:not(:checked) > label:before {
          content: '★ ';
      }

      .rating > input:checked ~ label {
          color: red;

      }

      .rating:not(:checked) > label:hover,
      .rating:not(:checked) > label:hover ~ label {
          color: green;

      }

      .rating > input:checked + label:hover,
      .rating > input:checked + label:hover ~ label,
      .rating > input:checked ~ label:hover,
      .rating > input:checked ~ label:hover ~ label,
      .rating > label:hover ~ input:checked ~ label {
          color: green;

      }

      .rating > label:active {
          position:relative;
          top:2px;
          left:2px;
      }

</style>



<div class="jumbotron background-field">
    <div class="container">
        <h4><strong>Reviews panel</strong></h4>
        <p class="lead">Here you can review all your opinions and rated and also edit them.</p>
        <hr>
        </br>
        <div class='column'>
            <a href="/profile"><img src='https://image.flaticon.com/icons/svg/118/118744.svg' hspace=10 width=20 height=20 style="margin-bottom:3px">Back to profile</a>
        </div>

</br>

  <% for i in range(0,len(joined)):%>

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
                <a href='/delete-review/{{joined[i][0]}}/{{joined[i][1]}}'><img style="float: left; margin-right: 2%;" src='https://image.flaticon.com/icons/svg/63/63260.svg' width=20 height=20></a>
                <a href='/profile/reviews/edit/{{joined[i][0]}}/{{joined[i][1]}}'><img style="float: left; margin-right: 2%;" src='https://image.flaticon.com/icons/svg/149/149307.svg' width=20 height=20></a>

              </div>
            </div>

<hr>
        <%end%>

      </div>
    </div>
