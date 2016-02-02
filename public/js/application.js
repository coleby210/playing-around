$(document).ready(function(){
  $(".edit-button").click(function(event){
    event.preventDefault();
    url = $(this).attr("href");
    $.ajax({
      method: "GET",
      url: url
    }).done(function(response){
      $("#start").html(response);
      $(function() {
        $('body').scrollTop(0);
      });
    });
  });
})

// function validate_form()  {
//   valid = true;

//   if($('input[type=checkbox]:checked').length == 0) {
//     alert ( "ERROR! You must select atleast one member!" );
//     valid = false;
//   };
//   return valid;
// };

// $('#run_table').jscroll({
//     nextSelector: 'tr',
//     contentSelector: 'tr',
//     autoTrigger: false
// });
