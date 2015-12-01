// Close alert message
$("a.alert-close").click(function(event) {
  event.preventDefault();
  $(".alert-flash").hide();
});

// Pick a date
$(function() {
  $('#story_event_date').pickadate({
    today: '',
    clear: '',
    close: '',
    max: new Date()
  });
});

// Autonumeric
$(document).trigger('refresh_autonumeric')
