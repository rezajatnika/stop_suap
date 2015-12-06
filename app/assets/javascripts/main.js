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

// Select2
$('#story_category_id').select2();
$('#story_location_attributes_province_id').select2();
$('#story_location_attributes_city_id').select2();

$(document).ready(function() {
  $('#story_location_attributes_province_id').change(function() {
    $.ajax({
       url: '/update_cities',
       data: { province_id: $('#story_location_attributes_province_id').val() },
       dataType: 'script'
     });
  });
});
