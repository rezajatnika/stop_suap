// Close alert message
$(document).on('ready page:load', function() {
  $("a.alert-close").click(function(event) {
    event.preventDefault();
    $(".alert-flash").hide();
  });
});

// Pick a date
$(document).ready(function() {
  $('#story_event_date').pickadate({
    today: '',
    clear: '',
    close: '',
    max: new Date()
  });
});
