
$(document).ready(function(){
  $.ajax({
    type: 'GET',
    url: '/api/v1/contestants/1/weekly_points',
    success: function(data) {

  Highcharts.chart('container', {
  chart: {
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false,
      type: 'pie'
  },
  title: {
      text: 'Employee Safety Form Performance'
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
              }
          }
      }
  },
  series: [{
      name: 'Brands',
      colorByPoint: true,
      data: [{
          name: 'Meeting Expectations',
          y: 14
      }, {
          name: 'Needs Improvement',
          y: 20
      }]
    }]
  })
}
});
});
