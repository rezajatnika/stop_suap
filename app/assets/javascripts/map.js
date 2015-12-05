var json = (function() {
  var json = null;
  $.ajax({
    'async': false,
    'global': false,
    'url': '/api/v1/map_data.json',
    'dataType': 'json',
    'success': function(data) {
      json = data;
    }
  });
  return json;
}());

$(function() {
  // Initiate the chart
  $('#container-map').highcharts('Map', {

    title : {
        text : ''
    },

    exporting: {
      enabled: false
    },

    credits: {
      enabled: false
    },

    subtitle: {
      text : ''
    },

    legend: {
      enabled: false
    },

    mapNavigation: {
      enabled: false,
      buttonOptions: {
          verticalAlign: 'bottom'
      }
    },

    colorAxis: {
      min: 0
    },

    series : [{
      data : json,
      mapData: Highcharts.maps['countries/id/id-all'],
      joinBy: 'hc-key',
      name: 'Laporan',
      states: {
        hover: {
            color: '#BADA55'
        }
      },
      dataLabels: {
        enabled: true,
        format: '{point.name}'
      }
    }]
  });
});
