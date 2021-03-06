function workerScores() {
  $.ajax({
    type: 'GET',
    url: '/api/v1/workers/' + $('[data-worker]').data('worker') + '/task_scores',
    success: function(data) {
      meeting_expectations_count = 0
      needs_improvement_count = 0

      $.each(data, function (key, value) {
      if(key <= 3){
        needs_improvement_count += value
      } else {
        meeting_expectations_count += value
      }
    })

  Highcharts.chart('worker-results', {
  chart: {
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false,
      type: 'pie'
  },
  colors: [
          '#122732',
          '#C4900F',
        ],
  title: {
      text: 'Performance Breakdown'
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
                colors: ['pink', 'black']
              }
          }
      }
  },
  series: [{
      name: 'Brands',
      colorByPoint: true,
      data: [{
          name: 'Meeting Expectations',
          y: meeting_expectations_count
      }, {
          name: 'Needs Improvement',
          y: needs_improvement_count
      }]
    }],
    credits: {
   enabled: false
  }
  })
  }
  });
}
