// Close alert message
$("a.alert-close").click(function(event) {
  event.preventDefault();
  $(".alert-flash").hide();
});

// Pick a date
$('#story_event_date').pickadate({
  today: '',
  clear: '',
  close: '',
  max: new Date()
});

// Currency
$('input[data-role=money]').autoNumeric('init', {
  aSep: '_',
  vMin: '0',
  vMax: '999999999'
});
