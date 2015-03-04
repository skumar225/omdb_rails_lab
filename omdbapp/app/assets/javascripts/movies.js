$(document).ready (function (){
  $("form").on("submit", function (event){
      event.preventDefault();

      var query = $("#movies").val();

      $("li").remove();
      
      $.getJSON("/movies/search", {movies:query}, function (data) {
        console.log(data);
      for (var i = 0; i < data.length; i++) {
        $("ul").append("<li>" + data[i].Title + " - " + data[i].Year+ "</li>");
      }  
    });
  });
});

