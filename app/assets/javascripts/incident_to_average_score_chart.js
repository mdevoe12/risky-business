$(document).ready(function(){

Highcharts.chart('incident-map', {
    chart: {
        type: 'scatter',
        zoomType: 'xy'
    },
    title: {
        text: '2017 Average FLRA Score vs Incident Rate per Worker'
    },
    subtitle: {

    },
    colors: [
            '#122732',
            '#C4900F',
          ],
    xAxis: {
      min: 0, max: 5,
        title: {
            enabled: true,
            text: 'Average FLRA Score'
        },
        startOnTick: true,
        endOnTick: true,
        showLastLabel: true
    },
    yAxis: {
      min: 0, max: 20,
        title: {
            text: 'Worker Incidents'
        }
    },
    legend: {
        layout: 'vertical',
        align: 'left',
        verticalAlign: 'top',
        x: 100,
        y: 70,
        floating: true,
        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
        borderWidth: 1
    },
    plotOptions: {
        scatter: {
            marker: {
                radius: 5,
                states: {
                    hover: {
                        enabled: true,
                        lineColor: 'rgb(100,100,100)'
                    }
                }
            },
            states: {
                hover: {
                    marker: {
                        enabled: false
                    }
                }
            },
            tooltip: {
                headerFormat: '<b>{series.name}</b><br>',
                pointFormat: '{point.x} Average Score, {point.y} Monthly Incident Rate'
            }
        }
    },
    series: [{
        name: 'Worker',
        color: 'black',
        data: [
            [lowScore(), highIncidentRate()], [lowScore(), highIncidentRate()],
            [lowScore(), highIncidentRate()], [lowScore(), highIncidentRate()],
            [lowScore(), highIncidentRate()], [lowScore(), highIncidentRate()],
            [lowScore(), highIncidentRate()], [lowScore(), highIncidentRate()],
            [lowScore(), highIncidentRate()], [lowScore(), highIncidentRate()],
            [lowScore(), highIncidentRate()], [lowScore(), highIncidentRate()],
            [lowScore(), highIncidentRate()], [lowScore(), highIncidentRate()],
            [lowScore(), highIncidentRate()], [lowScore(), highIncidentRate()],
            [lowScore(), highIncidentRate()], [lowScore(), highIncidentRate()],
            [lowScore(), highIncidentRate()], [lowScore(), highIncidentRate()],
            [lowScore(), highIncidentRate()], [lowScore(), highIncidentRate()],
            [highScore(), lowIncidentRate()], [highScore(), lowIncidentRate()],
            [highScore(), lowIncidentRate()], [highScore(), lowIncidentRate()],
            [highScore(), lowIncidentRate()], [highScore(), lowIncidentRate()],
            [highScore(), lowIncidentRate()], [highScore(), lowIncidentRate()],
            [highScore(), lowIncidentRate()], [highScore(), lowIncidentRate()],
            [highScore(), lowIncidentRate()], [highScore(), lowIncidentRate()],
            [highScore(), lowIncidentRate()], [highScore(), lowIncidentRate()],
            [highScore(), lowIncidentRate()], [highScore(), lowIncidentRate()],
            [highScore(), lowIncidentRate()], [highScore(), lowIncidentRate()],
            [highScore(), lowIncidentRate()], [highScore(), lowIncidentRate()],
            [highScore(), lowIncidentRate()], [highScore(), lowIncidentRate()],
            [highScore(), lowIncidentRate()], [highScore(), lowIncidentRate()],
            [highScore(), lowIncidentRate()], [highScore(), lowIncidentRate()],
            [highScore(), lowIncidentRate()], [highScore(), lowIncidentRate()],
            [highScore(), lowIncidentRate()], [highScore(), lowIncidentRate()],
            [highScore(), lowIncidentRate()], [highScore(), lowIncidentRate()],
            [lowScore(), lowIncidentRate()], [lowScore(), lowIncidentRate()],
            [lowScore(), lowIncidentRate()], [lowScore(), lowIncidentRate()],
            [highScore(), highIncidentRate()], [highScore(), highIncidentRate()]
          ]
    }]
  });
});

function lowScore() {
  num = (Math.random() * 2).toFixed(2);
  return parseFloat(num);

}

function highScore() {
  num = (Math.random() * 3 + 2).toFixed(2);
  return parseFloat(num);

}

function highIncidentRate() {
  num = (Math.random() * 6 + 12).toFixed(2);
  return parseFloat(num);

}

function lowIncidentRate() {
  num = (Math.random() * 10).toFixed(2);
  return parseFloat(num);
}
