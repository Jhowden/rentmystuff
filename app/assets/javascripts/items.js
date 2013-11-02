$(document).ready(function() {

  $('#nav-tabs').tabify();


  $('#Grid').mixitup();

  var varCount = 1
  //remove a textfield
  $('form').on('click', '.removeVar', function(){
     $(this).parent().remove();
  });
  //add a new node
  $('.addVar').on('click', function(){
    varCount++;
    $node = '<p><label for="photo_file'+varCount+'">Image </label><input type="file" name="photo[file'+varCount+']" id="photo_file'+varCount+'"><span class="removeVar">Remove Image</span></p>';
    $(this).parent().before($node);
  })

});
