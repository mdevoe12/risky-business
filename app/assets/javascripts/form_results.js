$(document).ready(function(){
  if ($('.slider').length > 0) {
    var workerId = $('[data-worker]').data().worker;
    fetchAverage(workerId);
    scoreListener();
    slideListener();
  };

  $.ajax({
    type: 'GET',
    url: '/api/v1/supervisors/' + $('.supervisor_information').data('id') + '/task_scores',
    success: function(data) {

      meeting_expectations_count = 0
      needs_improvement_count = 0

      $.each(data, function (key, value) {
      if(key >= 3){
        needs_improvement_count += value
      } else {
        meeting_expectations_count += value
      }
    })

  Highcharts.chart('form-results', {
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
      text: 'September 2017 FLRA Scores'
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
    }]
  })
}
});

$.ajax({
  type: 'GET',
  url: '/api/v1/managers/dashboard',
  success: function(data) {
    flras = data['flras']
    // debugger
    Highcharts.chart('flra-scores', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: 0,
            plotShadow: false
        },
        title: {
            text: 'October<br>FLRA Scores',
            align: 'center',
            verticalAlign: 'middle',
            y: 40
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                dataLabels: {
                    enabled: true,
                    distance: -50,
                    style: {
                        fontWeight: 'bold',
                        color: 'white'
                    }
                },
                startAngle: -90,
                endAngle: 90,
                center: ['50%', '75%']
            }
        },
        series: [{
            type: 'pie',
            name: 'Browser share',
            innerSize: '50%',
            data: [
                ['Satisfactory', flras.satisfactory],
                ['Needs Improvement', flras.needs_improvement],
            ]
        }]
    });
 }
})

});
