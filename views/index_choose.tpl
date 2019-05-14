% rebase('base.tpl', title='Python')

<style>

.card-title{
  color:black;

}
</style>


<div class="jumbotron background-field" style="margin-bottom: 0">
<div class="container" style="margin-bottom: 0">

<!-- FILTER -->


  <meta charset="utf-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <script>
  function myFunction() {
      var filter = $('#myFilter').val().toUpperCase();
      var cards = $('.myItems');
      for (i = 0; i < cards.length; i++) {
        var card = cards[i];
        var title = card.querySelector(".card-title").outerText.trim();
               if (title.toUpperCase().indexOf(filter) > -1) {
                   cards[i].style.display = "";
               } else {
                   cards[i].style.display = "none";
             }
      }
  }
  </script>

  <h4>Filter Movies</h4>
  <p>Start typing a movie title in the input field to search for the movie you want to rate.</p>
<hr width=1120rem>

  <input style="width: 70rem" class="form-control" id="myFilter" onkeyup="myFunction()" type="text" placeholder="Search...">

<% for i in range(0,len(film_cards)): %>
<section>
<div class="myItems" style="margin-top:15px">

            <div  class="card" style="width: 70rem" >
                <div  class="row" >
                    <div class="col-xl-2 ">
                        <img src='{{film_cards[i][8]}}' class="w-60 " align="middle">
                    </div>
                    <div class="col-xl-10 px-3">
                        <div class="card-block px-3 ">
                            </br>
                            <ul class="list-unstyled mt-3 mb-4 ">

                                <h4 class="card-title">
                                  {{film_cards[i][1]}} ({{film_cards[i][5]}})
                                </h4>

                                <p class="card-text ">{{film_cards[i][4]}}</p>
                            </ul>

                            <a href='film/{{film_cards[i][3]}}' class="btn btn-dark">See more</a>

                        </div>
                    </div>
                    </div>
                    </div>
  </div>


</section>

%end
</div>
</div>
