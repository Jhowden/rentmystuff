$(document).ready(function() {
   $('.feedback_form').on('submit', function(event) {
    event.preventDefault();
    var data = $(this).serialize();
    var that = $(this)
    $.post(window.location.pathname+"/feedbacks/create", data, function(response) {
      $('#feedback_received_title').after(response);
      that.remove();
    });
  });
});
