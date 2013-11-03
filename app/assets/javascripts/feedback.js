$(document).ready(function() {
   $(document).on('submit',".feedback_form", function(event) {
    event.preventDefault();
    var data = $(this).serialize();
    var that = $(this)
    $.post(window.location.pathname+"/feedbacks/create", data, function(response) {
      that.after(response);
      that.remove();
    });
  });

   $(document).on("click", "#show-feedback", function(){
    console.log($(".feedback_form"));
    $(".feedback_form").slideToggle();
   })
});
