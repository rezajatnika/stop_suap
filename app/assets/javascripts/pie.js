var pieData = (function() {
  var pieData = null;
  $.ajax({
    'async': false,
    'global': false,
    'url': '/api/v1/pie_data.json',
    'dataType': 'json',
    'success': function(data) {
      pieData = data;
    }
  });
  return pieData;
}());

var drillData = (function() {
  var drillData = null;
  $.ajax({
    'async': false,
    'global': false,
    'url': '/api/v1/province_data.json',
    'dataType': 'json',
    'success': function(data) {
      drillData = data;
    }
  });
  return drillData;
}());

$(function () {
  // Create the chart
  $('#container-chart').highcharts({
    credits: {
      enabled: false
    },

    chart: {
      type: 'pie'
    },

    title: {
      text: 'Prosentase persebaran laporan tindakan suap'
    },

    subtitle: {
      text: 'Klik tiap kategori untuk data lebih detail'
    },

    plotOptions: {
      series: {
        dataLabels: {
          enabled: true,
          format: '{point.name}: {point.y:.1f}%'
        }
      }
    },

    tooltip: {
      headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
      pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> dari jumlah total<br/>'
    },

    series: [{
      name: 'Kategori',
      colorByPoint: true,
      data: pieData
    }],

    drilldown: {
      series: drillData
    }
  });
});
