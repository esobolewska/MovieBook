% rebase('base.tpl', title='Python')
<style>

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

<div class="jumbotron background-field" style="margin-bottom: 0">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<div class='container' style="padding-bottom:148px">

  <div class='column'>
      <a href="/profile/reviews"><img src='https://image.flaticon.com/icons/svg/118/118744.svg' hspace=10 width=20 height=20 style="margin-bottom:3px">Back to reviews</a>
  </div>
      </br>

    <h4><strong>Edit review</strong></h4>
    <p class="lead">Here you can change your review.</p>
    <hr>

<form method='post'>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <div class="rating">
        <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="Amazing!">5 stars</label>
        <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Very Good">4 stars</label>
        <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="Good">3 stars</label>
        <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="Kinda bad">2 stars</label>
        <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="Bad">1 star</label>
    </div>

</br>
  <textarea type="text" placeholder="Write film review here" name="review"></textarea>

  <button type="submit" class="btn btn-light form-control" style="width:200px">Save changes</button>

</div>
</br>
<div>
