var mapData = (function() {
  var mapData = null;
  $.ajax({
    'async': false,
    'global': false,
    'url': '/api/v1/map_data.json',
    'dataType': 'json',
    'success': function(data) {
      mapData = data;
    }
  });
  return mapData;
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
      min: 0,
      type: 'linear',
      minColor: '#d3d3d3',
      maxColor: '#000000'
    },

    series : [{
      data : mapData,
      nullColor: 'grey',
      mapData: Highcharts.maps['countries/id/id-all'],
      joinBy: 'hc-key',
      name: 'Jumlah Laporan',
      states: {
        hover: {
            color: '#b80f0f'
        }
      },
      dataLabels: {
        enabled: false,
        format: '{point.name}'
      }
    }]
  });
});
