// foundation init
$(document).foundation();

//jquery step wizard
$("#report-wizard").steps({
    headerTag: "h3",
    bodyTag: "section",
    transitionEffect: "slideLeft",
    titleTemplate: '<span class="number">#index#</span>',
    autoFocus: true
});
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

// Filter cities by province
// $(function() {
//   filterCityList();
// });

