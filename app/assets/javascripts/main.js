// Close alert message
var alertClose = $('a.alert-close');
alertClose.click(function(event) {
  event.preventDefault();
  $('.alert-flash').hide();
});

// Pick a date
$('#story_event_date').pickadate({
  today: '',
  clear: '',
  close: '',
  max: new Date()
});

// Autonumeric
$(document).trigger('refresh_autonumeric')
