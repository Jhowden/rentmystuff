$(document).ready(function() {

  //fancybox
    /* This is basic - uses default settings */
  
  $("a.fancybox").fancybox();

  /* Apply fancybox to multiple items */
  
  $("a.group").fancybox({
    'transitionIn'  : 'fade',
    'transitionOut' : 'fade',
    'speedIn'   : 600, 
    'speedOut'    : 200, 
    'overlayShow' : true,
    'overlayColor' : '#666',
    'showCloseButton' : true
  });

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
    console.log('this works')
  })
});