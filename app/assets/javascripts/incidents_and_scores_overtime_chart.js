$(document).ready(function(){

Highcharts.chart('incidents-scores-time', {
    title: {
        text: '2017 Incidents and FLRA Scores Trends'
    },
    colors: [
            '#122732',
            '#C4900F',
            '#A3333D',
            '#A3333D'
          ],
    xAxis: {
        categories: ['January', 'February', 'March', 'April', 'May', "June", 'July', 'August', "September"]
    },
    yAxis: [{ // Primary yAxis
        labels: {
            format: '{value}',
            style: {
                color: Highcharts.getOptions().colors[1]
            }
        },
        title: {
            text: '# of FLRAs',
            style: {
                color: Highcharts.getOptions().colors[1]
            }
        }
    }, { // Secondary yAxis
      min: 0, max: 30,
        title: {
            text: 'Incidents Per Month',
            style: {
                color: Highcharts.getOptions().colors[0]
            }
        },
        labels: {
            format: '{value}',
            style: {
                color: Highcharts.getOptions().colors[0]
            }
        },
        opposite: true
    }],
    labels: {
        items: [{

            style: {
                left: '50px',
                top: '18px',
                color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
            }
        }]
    },
    series: [{
        type: 'column',
        name: 'FLRAs Meeting Expectations',
        data: [52, 63, 70, 78, 98, 101, 112, 123, 140]
    }, {
        type: 'column',
        name: 'FLRAs Needing Improvement',
        data: [98, 83, 74, 60, 45, 42, 38, 33, 25]
    }, {
        type: 'spline',
        yAxis: 1,
        name: 'Incidents Per Month',
        data: [25, 28, 24, 20, 19, 21, 17, 15, 12],
        marker: {
            lineWidth: 2,
            lineColor: Highcharts.getOptions().colors[3],
            fillColor: 'white'
        }
    }]
});
});
