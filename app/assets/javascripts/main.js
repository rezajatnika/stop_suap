// Close alert message
$(document).on('ready page:load', function() {
  $("a.alert-close").click(function(event) {
    event.preventDefault();
    $(".alert-flash").hide();
  });
});
