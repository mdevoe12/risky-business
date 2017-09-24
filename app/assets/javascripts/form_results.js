
$(document).ready(function(){
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
    console.log(meeting_expectations_count)
    console.log(needs_improvement_count)

  Highcharts.chart('container', {
  chart: {
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false,
      type: 'pie'
  },
  title: {
      text: 'Your FLRA Results'
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
          y: meeting_expectations_count
      }, {
          name: 'Needs Improvement',
          y: needs_improvement_count
      }]
    }]
  })
}
});
});
