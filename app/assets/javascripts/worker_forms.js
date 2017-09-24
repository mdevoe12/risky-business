$(document).on('ready', function() {
  scoreListener();
});

var scoreListener = function () {
  $('.score-button').click(function(event) {
    event.preventDefault();
    var id = $(this).parent().data().id;
    var score = $(this).text();
    var button = $(this);
    updateScore(id, score, button);
  })
};

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
      button.parent().fadeOut('slow');
    },
    failure: function(error) {
      console.error(error);
    }
  })
}
