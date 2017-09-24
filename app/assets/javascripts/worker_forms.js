$(document).on('ready', function() {
  var workerId = $('[data-worker]').data().worker;
  fetchAverage(workerId);
  scoreListener();
  slideListener();
});

var slideListener = function() {
  $('.slider').change(function() {
    $(this).next().text($(this)[0].value);
  })
};

var scoreListener = function () {
  $('.score-button').click(function(event) {
    event.preventDefault();
    var id = $(this).parent().data().id;
    var score = $(this).siblings('div.slidecontainer').children('input.slider.score-slider')[0].value;
    var button = $(this);
    var riskScore = $(this).siblings('div.slidecontainer').children('input.slider.risk-slider')[0].value;
    updateScore(id, score, button, riskScore);
  })
};

var fetchAverage = function(workerId) {
  return $.ajax({
    url: '/api/v1/workers/' + workerId + '/average',
    method: 'GET',
    success: function(data) {
      $('.average').text(data.average);
    }
  })
}

var updateScore = function(id, score, button, riskScore) {
  return $.ajax({
    url: '/api/v1/supervisors/tasks/' + id,
    method: 'PUT',
    data: {points: score, risk: riskScore},
    headers: {
      'X-Transaction': 'POST Example',
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    },
    success: function(data) {
      button.parent().parent().fadeOut('slow');
      fetchAverage($('[data-worker]').data().worker);
    },
    failure: function(error) {
      console.error(error);
    }
  })
}
