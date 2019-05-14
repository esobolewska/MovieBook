% rebase('base.tpl', title='Python')

<style>

    .column {
        float: left;
        width: 50%;
    }

    .media{
      float: left;
    }

    .reviewsection{
      padding-top: 50px;
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


<div class="jumbotron background-field" style="margin-bottom: 0">



<div class="container">
        <h2><strong> {{film_info[1]}} </strong>({{film_info[5]}})</h2>
        <h5><i>{{film_info[2]}}</i></h5>
        <hr>
        <a href="/choose"><img src='https://image.flaticon.com/icons/svg/118/118744.svg' hspace=10 width=20 height=20 style="margin-bottom:3px">Back to browsing films</a>
      </br>
</div>

</br>

<div class="container">
<div class='row'>
    <div class='column'>
      <img src={{film_info[8]}} alt="poster" height="500">
    </div>
    <div class="column">

<% if sum(joineddf[joineddf.id_film==film_id].film_rating)==0:%>

      <div class="card">
          <div class="card-body">
              <img class:'icon' src="https://image.flaticon.com/icons/svg/159/159772.svg" width=30 hspace=20>
              <strong>Average Rating: </strong>0.0
          </div>
      </div>

<%else:%>
      <div class="card">
          <div class="card-body">
              <img class:'icon' src="https://image.flaticon.com/icons/svg/159/159772.svg" width=30 hspace=20>
              <strong>Average Rating: </strong>{{sum(joineddf[joineddf.id_film==film_id].film_rating) / float(len(joineddf[joineddf.id_film==film_id].film_rating))}}/5.0
          </div>
      </div>
%end

        <div class="card">
            <div class="card-body">
                <img class:'icon' src="https://image.flaticon.com/icons/svg/149/149235.svg" width=30 hspace=20>
                <strong>Time: </strong>{{film_info[6]}}
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <img src='https://image.flaticon.com/icons/svg/82/82417.svg' width=40 hspace=15>
                <strong>Genre: </strong>{{film_info[7]}}
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <img src='https://image.flaticon.com/icons/svg/229/229737.svg' width=30 hspace=20>
                <strong>Director: </strong>{{film_info[9]}}</br>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <img src='https://image.flaticon.com/icons/svg/1305/1305419.svg' width=30 hspace=20>
                <strong>Writer: </strong>{{film_info[10]}}</br>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <img src='https://image.flaticon.com/icons/svg/75/75897.svg' width=30 hspace=20>
                <strong>Stars: </strong>{{film_info[11]}}</br>
            </div>
        </div>
        </br>
        <p align='justify'>{{film_info[4]}}</p>
    </div>
  </div>
</div>


<div class='container reviewsection'>
  <h5><strong>Review this film:</strong></h5>
  <hr>
  <div class="form-group">

    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<form method='post'>
    <div class="container">
    	<div class="row">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <div class="rating">
            <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="Amazing!">5 stars</label>
            <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Very Good">4 stars</label>
            <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="Good">3 stars</label>
            <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="Kinda bad">2 stars</label>
            <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="Bad">1 star</label>
          </div>
    	</div>
    </div>
  <textarea  class="form-control" placeholder="Write film review here" rows="5" id='myInput' name="review"></textarea>
</div>
<button type="submit" onClick="window.location.reload()" class="btn btn-dark">Add review</button>
</form>
</div>

<% if modal_title!='': %>
<div class='container'>
</br></br>
<h4> {{modal_title}}</h4>
<p>{{modal_text}}</p>
</div>
%end


<div class='container reviewsection'>
  <h5><strong>All reviews:</strong></h5>
  <hr>
  </br>


<% for i in range(0,len(joineddf)): %>
<div class="media">
  <img class="align-self-start mr-3" src="{{avatar_url[i]}}" alt="Generic placeholder image" width=50 height=50>
  <div class="media-body">
    <h5 class="mt-0"><strong>{{opinion_username[i]}}</strong></h5>
    <h6><strong>Rating:</strong> {{film_rating[i]}} stars</h6>
    <p>{{opinion_text[i]}}</p>
    <p>{{date_added[i]}}</p>
  </div>

</div>
</br></br></br></br></br></br></br>
%end
</div>

</div>
