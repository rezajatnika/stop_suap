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


$(function () {

    // Radialize the colors
    // Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
    //     return {
    //         radialGradient: {
    //             cx: 0.5,
    //             cy: 0.3,
    //             r: 0.7
    //         },
    //         stops: [
    //             [0, color],
    //             [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
    //         ]
    //     };
    // });

    // Build the chart
    $('#container-chart-2').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Browser market shares. January, 2015 to May, 2015'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    },
                    connectorColor: 'silver'
                }
            }
        },
        series: [{
            name: 'Brands',
            data: pieData
        }]
    });
});