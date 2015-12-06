// foundation init
$(document).foundation();

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
// $(document).on('ready page:load', function() {
//   return $('#new_comment').on('ajax:success', function(e, data, status, xhr) {
//     return $('#new_comment #comment_body').val('');
//   }).on('ajax:error', function(e, xhr, status, error) {
//     return $('#new_comment').append('<p>ERROR</p>');
//   });
// });

$('#story_category_id').select2();
$('#story_location_attributes_province_id').select2();
$('#story_location_attributes_city_id').select2();
