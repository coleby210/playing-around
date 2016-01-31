$(document).ready(function(){
  $(".edit-button").click(function(event){
    event.preventDefault();
    if ($(".edit-button").hasClass("disabled")){
      return false
    }
    else {
      url = $(this).attr("href");
      $.ajax({
        method: "GET",
        url: url
      }).done(function(response){
        $("#start").parent().prepend(response);
        $(".edit-button").addClass('disabled');
      });
    };
  });
})
