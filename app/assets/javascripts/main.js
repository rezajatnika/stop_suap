// Close alert message
$("a.alert-close").click(function(event) {
  event.preventDefault();
  $(".alert-flash").hide();
});

// Pick a date
$(document).on('ready', function() {
  $('#story_event_date').pickadate({
    today: '',
    clear: '',
    close: '',
    max: new Date()
  });
});

// Currency
$('#story_amount').autoNumeric('init', {
  aSep: '_',
  vMin: '0',
  vMax: '999999999'
});
