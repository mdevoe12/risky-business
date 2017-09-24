$(document).on('ready', function() {
  var workerId = $('[data-worker]').data().worker;
  fetchAverage(workerId);
  scoreListener();
});

var scoreListener = function () {
  $('.score-button').click(function(event) {
    event.preventDefault();
    var id = $(this).parent().parent().data().id;
    var score = $(this).text();
    var button = $(this);
    updateScore(id, score, button);
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

var updateScore = function(id, score, button) {
  return $.ajax({
    url: '/api/v1/supervisors/tasks/' + id,
    method: 'PUT',
    data: {points: score},
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
