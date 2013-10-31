$(document).ready(function(){

  var currentTime = new Date();
  var disabled = ['2013-11-04', '2013-10-28', '2013-10-27'];

$('#from-date-picker').datepicker({
  constrainInput: true,
  minDate: 0,
  maxDate: 30,
  beforeShowDay: function(date){
    var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
    return [ disabled.indexOf(string) == -1 ];
  }
});

$('#to-date-picker').datepicker({
  constrainInput: true,
  minDate: 0,
  maxDate: 30,
  beforeShowDay: function(date){
    var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
    return [ disabled.indexOf(string) == -1 ];
  }
});
});
