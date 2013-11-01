$(document).ready(function(){

  var disabled = ['2013-11-04', '2013-10-28', '2013-10-27'];
  var maxDate = 60

  $('#from-date-picker').datepicker({
    constrainInput: true,
    minDate: 0,
    maxDate: maxDate,
    beforeShowDay: function(date){
      var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
      return [ disabled.indexOf(string) == -1 ];
    }
  });

  $('#to-date-picker').datepicker({
    constrainInput: true,
    minDate: 0,
    maxDate: maxDate,
    beforeShowDay: function(date){
      var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
      return [ disabled.indexOf(string) == -1 ];
    }
  });

});
