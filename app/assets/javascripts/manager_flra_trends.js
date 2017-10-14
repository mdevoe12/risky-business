function managerTrends() {
  Highcharts.chart('manager-trends', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'FLRA Quality Year-to-Date'
    },
    xAxis: {
        categories: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October']
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Percentage'
        }
    },
    colors: ['#5c5c61', '#97cffd'],
    tooltip: {
        pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',
        shared: true
    },
    plotOptions: {
        column: {
            stacking: 'percent'
        }
    },
    series: [{
        name: 'Needs Improvement',
        data: [2, 2, 3, 2, 1, 6, 2, 4, 2, 5]
    }, {
        name: 'Satisfactory',
        data: [5, 3, 4, 7, 2, 7, 9, 1, 5, 7]
    }],
    credits: {
      enabled: false
    }
  });
}

function injuryTrends() {
  Highcharts.chart('injury-count', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Injury Report Year-to-Date'
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
            text: 'Injury Count'
        }
    },
    legend: {
        enabled: false
    },
    tooltip: {
        pointFormat: '<b>{point.y:.1f} injuries</b>'
    },
    colors: ['#960909'],
    series: [{
        name: 'Quantity',
        data: [
            ['January', 12],
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
    }],
    credits: {
   enabled: false
  }
});
}
