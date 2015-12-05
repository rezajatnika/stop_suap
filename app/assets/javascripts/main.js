// foundation init
$(document).foundation();

//jquery step wizard
// $("#report-wizard").steps({
//     headerTag: "h3",
//     bodyTag: "section",
//     transitionEffect: "slideLeft",
//     titleTemplate: '<span class="number">#index#</span>',
//     autoFocus: true
// });

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

// Posting Comment AJAX
$(document).on('ready page:load', function() {
  return $('#new_comment').on('ajax:success', function(e, data, status, xhr) {
    $('#new_comment').append('comment posted');
    return $('#new_comment #comment_body').val('');
  }).on('ajax:error', function(e, xhr, status, error) {
    return $('#new_comment').append('<p>ERROR</p>');
  });
});

// Filter cities by province
// $(function() {
//   filterCityList();
// });

