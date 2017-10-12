
var slideListener = function() {
  $('.slider').change(function() {
    $(this).next().text($(this)[0].value);
  })
};

function revealForm() {
  $('div.row.form').first().removeClass('hidden');
}

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

function updateCounts() {
  let worker_id = $('[data-worker]').data().worker
  let super_id = $('[data-worker]').data().super
  $.ajax({
    url: `/api/v1/workers/${worker_id}/flra-counts/`,
    method: 'GET',
    data: {super_id: super_id},
    success: function(data) {
      $('.form-count').text(data.forms)
      $('.follow-count').text(data.followups)
    }
  })
}

function updateSuperCounts() {
  let super_id = $('[data-id]').data().id
  $.ajax({
    url: `/api/v1/supervisors/${super_id}/flra-counts/`,
    method: 'GET',
    success: function(data) {
      $('.super-form-count').text(data.forms)
      $('.super-follow-count').text(data.followups)
    }
  })
}

var updateScore = function(id, score, button, riskScore) {
  let form = button.parent().parent().parent().parent()
  return $.ajax({
    url: '/api/v1/supervisors/flras/' + id,
    method: 'PUT',
    data: {points: score, super_risk_score: riskScore},
    headers: {
      'X-Transaction': 'POST Example',
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    },
    success: function(data) {
      form.animate({'left': '-=2000px'}, 300, function() {
        form.hide()
        form.next().removeClass('hidden')
      })
      fetchAverage($('[data-worker]').data().worker);
      workerScores();
      if (document.URL.includes('worker')) {
        updateCounts()
      } else {
        updateSuperCounts()
      }
    },
    failure: function(error) {
      console.error(error);
    }
  })
}
