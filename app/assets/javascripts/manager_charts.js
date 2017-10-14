function getManagerData() {
  $.ajax({
    type: 'GET',
    url: '/api/v1/managers/dashboard',
    success: function(data) {
      flras = data['flras']
      supervisors = data['supervisors']
      renderFlrasChart(flras)
      appendSupervisorTable(supervisors)
    }
  })
}

function appendSupervisorTable(supervisors) {
  supervisors.forEach(function(supervisor) {
  $("#supervisors-header").after(
    "<tr><td> " + supervisor.Name + " </td><td> " + supervisor.Reviewed + " </td><td> " + supervisor.Outstanding "</td></tr>" 
  );
})
}

function renderFlrasChart(flras) {
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
          name: 'percentage',
          innerSize: '50%',
          data: [
              ['Satisfactory', flras.satisfactory],
              ['Needs Improvement', flras.needs_improvement],
          ]
      }]
  });
}
