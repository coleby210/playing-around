$(document).ready(function(){
  $(".edit-button").click(function(event){
    event.preventDefault();
    url = $(this).attr("href");
    $.ajax({
      method: "GET",
      url: url
    }).done(function(response){
      $("#start").parent().prepend(response);
    });
  });
})
