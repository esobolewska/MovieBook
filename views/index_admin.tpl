% rebase('base.tpl', title='Python')


<div class="jumbotron background-field" style="margin-bottom: 0; padding-bottom: 233px">
<div class="container" style="margin-bottom: 0">
  <h4>Welcome to the Admin panel!</h4>
  <p class="lead">In this panel you can find interesting statistics, latest added movies, latest added rates and most active users. Start exploring!</p>

<hr>
</br>

<div class="row" style="margin-bottom: 0">
  <div class="col-xl" style="margin-bottom: 0">

    <div class="card" style="width: 20rem;">
      <div class="card-body">

        <h5 class="card-title"><strong>Number of films:</strong></h5>
        <p class="card-text">{{number_of_films}}</p>

      </div>
    </div>

  </div>
  <div class="col-xl">

    <div class="card" style="width: 20rem;">
      <div class="card-body">

        <h5 class="card-title"><strong>Number of rates:</strong></h5>
        <p class="card-text">{{number_of_opinions}}</p>

      </div>
    </div>

  </div>
  <div class="col-xl">

    <div class="card" style="width: 20rem;">
      <div class="card-body">

        <h5 class="card-title"><strong>Number of users:</strong></h5>
        <p class="card-text">{{number_of_users}}</p>

      </div>
    </div>
  </div>


  <div class="col-xl">
</br>
    <div class="card" style="width: 20rem;">
      <div class="card-body">

        <h5 class="card-title"><strong>Most liked movies:</strong></h5>
        <p class="card-text">

          <ol style="padding-left: 20px";>
            <%for film in most_liked[0:5]:%>
          <li>{{film[1]}} ({{film[0]}})</li>
          <%end%>
          </ol>

        </p>

      </div>
    </div>
  </div>

  <div class="col-xl">
</br>
    <div class="card" style="width: 20rem;">
      <div class="card-body">

        <h5 class="card-title"><strong>Most disliked movies:</strong></h5>
        <p class="card-text">

          <ol style="padding-left: 20px";>
          <%for film in most_disliked[0:5]:%>
          <li>{{film[1]}} ({{film[0]}})</li>
          <%end%>
          </ol>
        </p>
      </div>
    </div>
  </div>


  <div class="col-xl">
</br>
    <div class="card" style="width: 20rem;">
      <div class="card-body">

        <h5 class="card-title"><strong>Most active users:</strong></h5>
        <p class="card-text">
          <ol style="padding-left: 20px";>
            <%for user in activity[0:5]:%>
          <li>{{user[1]}} ({{user[0]}})</li>
          <%end%>
        </ol></p>

      </div>
    </div>
  </div>



</div>
</div>
</div>
