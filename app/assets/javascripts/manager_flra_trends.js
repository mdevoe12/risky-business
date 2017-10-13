function managerTrends() {
  Highcharts.chart('manager-trends', {
      chart: {
          type: 'line'
      },
      title: {
          text: 'FLRA Quality Month-by-Month'
      },
      xAxis: {
          categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct']
      },
      yAxis: {
          title: {
              text: 'Quantity'
          }
      },
      plotOptions: {
          line: {
              dataLabels: {
                  enabled: true
              },
              enableMouseTracking: false
          }
      },
      series: [{
          name: 'Satisfactory',
          data: [7.0, 6.0, 9.0, 14.0, 18.0, 21.0, 25.0, 26.0, 23.0, 18.0, 13.0, 9.0]
      }, {
          name: 'Needs Improvement',
          data: [3.0, 4.0, 5.0, 8.0, 11.0, 15.0, 17.0, 16.0, 14.0, 10.0, 6.0, 4.0]
      }]
  });
}

function injuryTrends() {
  Highcharts.chart('injury-count', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Injury Count by Month'
    },
    xAxis: {
        type: 'category',
        labels: {
            rotation: -45,
            style: {
                fontSize: '13px',
                fontFamily: 'Verdana, sans-serif'
            }
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Number of Injuries'
        }
    },
    legend: {
        enabled: false
    },
    tooltip: {
        pointFormat: '<b>{point.y:.1f} injuries</b>'
    },
    series: [{
        name: 'Quantity',
        data: [
            ['January', 23],
            ['February', 16],
            ['March', 14],
            ['April', 14],
            ['May', 12],
            ['June', 12],
            ['July', 11],
            ['August', 11],
            ['September', 11],
            ['October', 11],
        ],
        dataLabels: {
            enabled: true,
            rotation: -90,
            color: '#FFFFFF',
            align: 'right',
            format: '{point.y:.1f}', // one decimal
            y: 10, // 10 pixels down from the top
            style: {
                fontSize: '13px',
                fontFamily: 'Verdana, sans-serif'
            }
        }
    }]
});
}
