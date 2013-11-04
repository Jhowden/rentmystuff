$(document).ready(function() {
  //  $(document).on('submit',"#feedback_form", function(event) {
  //   event.preventDefault();
  //   var data = $(this).serialize();
  //   var that = $(this)
  //   $.post(window.location.pathname+"/feedbacks/create", data, function(response) {
  //     that.after(response);
  //     that.remove();
  //   });
  // });

  //  $(document).on('submit',"#first_feedback_form", function(event) {
  //   event.preventDefault();
  //   var data = $(this).serialize();
  //   var that = $(this)
  //   $.post(window.location.pathname+"/feedbacks/create", data, function(response) {
  //     that.after(response);
  //     that.remove();
  //   });
  // });

   $(document).on("click", "#show-feedback", function(){
    $("#feedback_form").slideToggle();
   })

   $(document).on("click", "#first-show-feedback", function(){
    $("#first_feedback_form").slideToggle();
   })
});
