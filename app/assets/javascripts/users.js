$(document).ready(function() {

  $('#nav_tabs').tabify();

  $('#user_about_update_form').hide();
  $('#show_form_button').on('submit', function(event){
    event.preventDefault();
    $('#show_form_button').hide();
    $('#user_about_update_form').show();
  });

  $('#user_about_update_form').on('submit', function(event){
    event.preventDefault()
    var data = $('#user_about_update_form form').serialize();
    var url = $('#user_about_update_form form').attr('action')
    $.post(url, data, function(response) {
      console.log(response)
      $("#about-me").html("About me: " + response.about)
    })
    $('#show_form_button').show();
    $('#user_about_update_form').hide();

  }); //final_form

}); //lasts
